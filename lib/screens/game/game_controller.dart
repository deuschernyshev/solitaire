import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class GameController extends GetxController {
  final RxList<int> _firstStack = <int>[].obs;
  final RxList<int> _secondStack = <int>[].obs;
  final RxList<int> _thirdStack = <int>[].obs;
  final RxList<int> _fourthStack = <int>[].obs;
  final RxList<int> _deckStack = <int>[].obs;
  final RxInt _score = 0.obs;

  RxList<int> get firstStack => _firstStack;
  RxList<int> get secondStack => _secondStack;
  RxList<int> get thirdStack => _thirdStack;
  RxList<int> get fourthStack => _fourthStack;
  RxList<int> get deckStack => _deckStack;
  RxInt get score => _score;

  @override
  void onInit() {
    generateDeckValue();
    generateDeckValue();

    super.onInit();
  }

  Color getCardColor(int value) {
    final Map<int, Color> colors = {
      2: Colors.grey,
      4: Colors.yellow,
      8: Colors.amber,
      16: Colors.red,
      32: Colors.green,
      64: Colors.purpleAccent,
      128: Colors.pink,
      256: Colors.lightGreen,
      512: Colors.deepPurple,
      1024: Colors.lightBlue,
      2048: Colors.cyan,
    };

    return colors[value] ?? Colors.cyan;
  }

  void placeCard({
    required RxList<int> source,
    required RxList<int> target,
    required int value,
  }) {
    if (target.length >= 10) return;

    _moveItemBetweenLists(
      source: source,
      target: target,
      value: value,
    );
    _checkStackedDuplicates(target);
    _checkIf2048InListExists(target);
  }

  void _moveItemBetweenLists({
    required RxList<int> source,
    required RxList<int> target,
    required int value,
  }) {
    target.add(value);
    source.remove(value);
  }

  void _checkStackedDuplicates(RxList<int> list) {
    if (list.length < 2) return;

    for (int i = 0; i < list.length - 1; i++) {
      if (list[i] == list[i + 1]) {
        final int doubledValue = list[i] * 2;

        list[i] = doubledValue;
        list.removeAt(i + 1);

        _increaseScore(doubledValue);

        _checkStackedDuplicates(list);
      }
    }
  }

  void _checkIf2048InListExists(RxList<int> list) {
    if (list.where((value) => value >= 2048).isNotEmpty) {
      list.clear();
    }
  }

  void generateDeckValue() {
    if (_deckStack.length >= 2) return;

    final Random random = Random();
    final int powOfTwo = random.nextInt(6) + 1;
    final int value = pow(2, powOfTwo).toInt();

    _deckStack.insert(0, value);
  }

  void _increaseScore(int value) {
    _score(_score.value + value);
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solitaire/screens/game/game_controller.dart';
import 'package:solitaire/widgets/broke_line_divider.dart';
import 'package:solitaire/widgets/empty_card.dart';
import 'package:solitaire/widgets/playing_card.dart';

class GameScreen extends GetView<GameController> {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Text(controller.score.toString()),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Row(
              children: List.generate(4, (index) => const EmptyCard()),
            ),
            Column(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Obx(
                    () => Row(
                      children: <Widget>[
                        Expanded(
                          child: _generateCardStack(controller.firstStack),
                        ),
                        Expanded(
                          child: _generateCardStack(controller.secondStack),
                        ),
                        Expanded(
                          child: _generateCardStack(controller.thirdStack),
                        ),
                        Expanded(
                          child: _generateCardStack(controller.fourthStack),
                        ),
                      ],
                    ),
                  ),
                ),
                const BrokeLineDivider(),
                Expanded(
                  child: Obx(
                    () => _generateDeckStack(controller.deckStack),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _generateCardStack(RxList<int> values) {
    final List<Widget> widgetsInStack = [];

    for (int i = 0; i < values.length; i++) {
      final Widget card = PlayingCard(
        cardValue: values[i],
      );

      final Widget widgetToAdd = Positioned(
        top: i * Get.height / 20,
        child: card,
      );

      widgetsInStack.add(widgetToAdd);
    }

    return DragTarget<List>(
      onAccept: (data) => controller.placeCard(
        source: data.first as RxList<int>,
        target: values,
        value: data.last as int,
      ),
      builder: (context, candidateItems, rejectedItems) => Stack(
        children: widgetsInStack,
      ),
    );
  }

  Widget _generateDeckStack(RxList<int> values) {
    final List<Widget> widgetsInStack = [];

    for (int i = 0; i < values.length; i++) {
      final Widget card = PlayingCard(
        cardValue: values[i],
      );

      final Widget widgetToAdd = Positioned(
        left: i * Get.width / 8,
        child: i == 0
            ? card
            : Draggable<List>(
                data: [values, values[i]],
                onDragCompleted: controller.generateDeckValue,
                feedback: card,
                childWhenDragging: SizedBox(
                  width: Get.width / 4,
                ),
                child: card,
              ),
      );

      widgetsInStack.add(widgetToAdd);
    }

    return Stack(
      children: widgetsInStack,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solitaire/screens/game/game_controller.dart';
import 'package:solitaire/shared/theme_config.dart';

class PlayingCard extends GetView<GameController> {
  final int cardValue;

  const PlayingCard({
    super.key,
    required this.cardValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 6,
      width: Get.width / 4,
      padding: const EdgeInsets.all(ThemeConfig.defaultGap / 2),
      decoration: BoxDecoration(
        color: controller.getCardColor(cardValue),
        borderRadius: BorderRadius.circular(ThemeConfig.defaultGap),
        border: Border.all(
          width: 2,
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
      ),
      child: DefaultTextStyle(
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        child: Text(
          cardValue.toString(),
        ),
      ),
    );
  }
}

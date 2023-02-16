import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solitaire/screens/game/game_controller.dart';
import 'package:solitaire/shared/theme_config.dart';

class EmptyCard extends GetView<GameController> {
  const EmptyCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 6,
      width: Get.width / 4,
      padding: const EdgeInsets.all(ThemeConfig.defaultGap / 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ThemeConfig.defaultGap),
        border: Border.all(
          width: 2,
          color: Colors.grey[800]!,
        ),
      ),
      child: Center(
        child: Icon(
          Icons.data_array_sharp,
          color: Colors.grey[800],
        ),
      ),
    );
  }
}

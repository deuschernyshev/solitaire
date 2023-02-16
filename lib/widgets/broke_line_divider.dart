import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solitaire/shared/theme_config.dart';

class BrokeLineDivider extends StatelessWidget {
  final int numOfLines;

  const BrokeLineDivider({
    super.key,
    this.numOfLines = 10,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          numOfLines,
          (index) => Container(
            width: Get.width / numOfLines - ThemeConfig.defaultGap,
            height: 3,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

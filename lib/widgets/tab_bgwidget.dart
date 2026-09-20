import 'package:flutter/material.dart';
import 'package:islamiapp/common/app_colors.dart';

class QtabbgWidget extends StatelessWidget {
    final String imagePath;

  const QtabbgWidget(  {super.key, required this.imagePath, });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
children: [
      Image.asset(imagePath,
          fit: BoxFit.cover,
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.blackColor.withValues(alpha: 0.7),
                AppColors.blackColor,
              ],
            ),
          ),
        ),
]
    );
  }
}
import 'package:flutter/material.dart';
import 'package:islamiapp/common/app_colors.dart';

class RadioTabButton extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onTap;

  const RadioTabButton({
    super.key,
    required this.title,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected
              ? AppColors.goldColor
              : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: selected
                ? AppColors.blackColor
                : Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:goldy_app/core/constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    this.onTap,
    this.backgroundColor, this.width, this.height,
  });
  final String title;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final double? width, height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height ,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.kGoldColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          alignment: Alignment.center,
        ),
        child: Text(title, style: TextStyle(color: AppColors.kBlackColor)),
      ),
    );
  }
}

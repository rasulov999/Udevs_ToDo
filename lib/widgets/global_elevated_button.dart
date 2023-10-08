import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:udevs_todo/utils/colors.dart';
import 'package:udevs_todo/utils/icons.dart';
import 'package:udevs_todo/utils/styles.dart';

class GlobalElevatedButton extends StatelessWidget {
  const GlobalElevatedButton({
    super.key,
    required this.backgroundColor,
    required this.onTap,
    required this.text,
    this.isDeletedButton = false,
  });
  final VoidCallback onTap;
  final Color backgroundColor;
  final String text;
  final bool isDeletedButton;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        child: isDeletedButton
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppIcons.deleteIcon),
                  SizedBox(width: 10.w),
                  Text(
                    text,
                    style: AppTextStyles.style16w600
                        .copyWith(fontSize: 14, color: AppColors.c_292929),
                  ),
                ],
              )
            : Text(
                text,
                style: AppTextStyles.style16w600.copyWith(
                    fontWeight: FontWeight.w400, color: AppColors.white),
              ),
      ),
    );
  }
}

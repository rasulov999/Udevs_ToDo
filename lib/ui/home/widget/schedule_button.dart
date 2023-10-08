import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udevs_todo/utils/colors.dart';
import 'package:udevs_todo/utils/styles.dart';

class ScheduleButton extends StatelessWidget {
  const ScheduleButton({super.key, required this.onTap});
final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Schedule",
          style: AppTextStyles.style16w600
              .copyWith(fontSize: 14.sp, color: AppColors.c_292929),
        ),
        SizedBox(
          //  height: 30,
          width: 102,
          child: ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: AppColors.c_009FEE,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            child: Text(
              "+ Add Event",
              style: AppTextStyles.style16w600
                  .copyWith(fontSize: 10.sp, color: AppColors.white),
            ),
          ),
        ),
      ],
    );
  }
}

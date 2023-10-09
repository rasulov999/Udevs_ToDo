import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:udevs_todo/utils/colors.dart';
import 'package:udevs_todo/utils/icons.dart';
import 'package:udevs_todo/utils/styles.dart';

class TextfieldWithTitle extends StatelessWidget {
  const TextfieldWithTitle({
    super.key,
    required this.title,
    required this.controller,
    this.linesCount = 1,
    this.isLocation = false,
  });
  final String title;
  final TextEditingController controller;
  final int linesCount;
  final bool isLocation;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.style14w500
              .copyWith(fontWeight: FontWeight.w400, color: AppColors.gray900),
        ),
        SizedBox(height: 6.h),
        TextFormField(
          maxLines: linesCount,
          controller: controller,
          decoration: InputDecoration(
            suffixIcon: isLocation
                ? Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SvgPicture.asset(
                      AppIcons.locationIcon,
                      // ignore: deprecated_member_use
                      color: AppColors.c_009FEE,
                    ),
                  )
                : const SizedBox(),
            fillColor: AppColors.gray100,
            filled: true,
            isDense: true,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide.none),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
        ),
      ],
    );
  }
}

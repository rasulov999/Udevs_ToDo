import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:udevs_todo/data/models/event_model.dart';
import 'package:udevs_todo/utils/colors.dart';
import 'package:udevs_todo/utils/constants.dart';
import 'package:udevs_todo/utils/icons.dart';
import 'package:udevs_todo/utils/styles.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key, required this.eventModel});
final EventModel eventModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      //  height: 248,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.c_009FEE,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.r),
          bottomRight: Radius.circular(20.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: EdgeInsets.all(6.r),
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                      color: AppColors.white, shape: BoxShape.circle),
                  child: SvgPicture.asset(AppIcons.backIcon),
                ),
              ),
              TextButton(
                onPressed: () =>
                    Navigator.pushNamed(context, updateEventScreen),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      AppIcons.editIcon,
                    ),
                    Text(
                      "Edit",
                      style: AppTextStyles.style14w500
                          .copyWith(color: AppColors.white),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 20.h),
          Text(
            eventModel.name,
            style: AppTextStyles.style16w600
                .copyWith(color: AppColors.white, fontSize: 26),
          ),
          Text(
            eventModel.description,
            style: AppTextStyles.style8w400.copyWith(color: AppColors.white),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              children: [
                SvgPicture.asset(
                  AppIcons.timeIcon,
                  // ignore: deprecated_member_use
                  color: AppColors.white,
                ),
                SizedBox(width: 6.w),
                Text(
                  "17:00 - 18:30",
                  style: AppTextStyles.style14w500
                      .copyWith(fontSize: 10, color: AppColors.white),
                ),
              ],
            ),
          ),
          Row(
            children: [
              SvgPicture.asset(
                AppIcons.locationIcon,
                // ignore: deprecated_member_use
                color: AppColors.white,
              ),
              SizedBox(width: 6.w),
              Text(
                "Stamford Bridge",
                style: AppTextStyles.style14w500
                    .copyWith(fontSize: 10, color: AppColors.white),
              ),
            ],
          ),
          SizedBox(height: 20.h)
        ],
      ),
    );
  }
}

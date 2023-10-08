import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udevs_todo/data/models/event_model.dart';
import 'package:udevs_todo/utils/colors.dart';
import 'package:udevs_todo/utils/styles.dart';

class EventContainer extends StatelessWidget {
  const EventContainer({super.key, required this.eventModel});
  final EventModel eventModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 10,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.c_009FEE,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.r),
              topRight: Radius.circular(10.r),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          width: double.infinity,
          height: 85,
          decoration: BoxDecoration(
            color: AppColors.c_009FEE.withOpacity(0.20),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10.r),
              bottomRight: Radius.circular(10.r),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                eventModel.name,
                style: AppTextStyles.style16w600
                    .copyWith(fontSize: 14, color: AppColors.c_056EA1),
              ),
              Text(
                eventModel.description,
                style: AppTextStyles.style16w600.copyWith(
                    fontSize: 8,
                    color: AppColors.c_056EA1,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
      ],
    );
  }
}

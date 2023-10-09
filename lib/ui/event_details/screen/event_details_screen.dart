import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udevs_todo/data/models/event_model.dart';
import 'package:udevs_todo/ui/event_details/bloc/delete_event_bloc_bloc.dart';
import 'package:udevs_todo/ui/event_details/widget/header_widget.dart';
import 'package:udevs_todo/ui/home/bloc/get_events_bloc.dart';
import 'package:udevs_todo/utils/colors.dart';
import 'package:udevs_todo/utils/form_status.dart';
import 'package:udevs_todo/utils/styles.dart';
import 'package:udevs_todo/widgets/global_elevated_button.dart';

class EventDetailsSccreen extends StatelessWidget {
  const EventDetailsSccreen({super.key, required this.eventModel});
  final EventModel eventModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderWidget(
            eventModel: eventModel,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30.h),
                Text(
                  "Reminder",
                  style: AppTextStyles.style16w600
                      .copyWith(color: AppColors.black),
                ),
                SizedBox(height: 20.h),
                Text(
                  "15 minutes before",
                  style: AppTextStyles.style14w500
                      .copyWith(fontSize: 16, color: AppColors.c_7C7B7B),
                ),
                SizedBox(height: 20.h),
                Text(
                  "Description",
                  style: AppTextStyles.style16w600
                      .copyWith(color: AppColors.black),
                ),
                SizedBox(height: 20.h),
                Text(
                  eventModel.description,
                  style: AppTextStyles.style8w400
                      .copyWith(fontSize: 10.sp, color: AppColors.c_999999),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar:
          BlocListener<DeleteEventBlocBloc, DeleteEventBlocState>(
        listener: (context, state) {
          if (state.status == Status.deleted) {
            BlocProvider.of<GetEventsBloc>(context).add(GetEventsEvent());
            Future.delayed(const Duration(milliseconds: 50))
                .then((value) => Navigator.pop(context));
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10),
          child: GlobalElevatedButton(
              isDeletedButton: true,
              backgroundColor: AppColors.c_FEE8E9,
              onTap: () {
                BlocProvider.of<DeleteEventBlocBloc>(context)
                    .add(DeleteEvent(eventModel: eventModel));
              },
              text: "Delete Event"),
        ),
      ),
    );
  }
}

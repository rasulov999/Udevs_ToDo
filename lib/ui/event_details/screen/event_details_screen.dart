import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udevs_todo/data/database/local_database.dart';
import 'package:udevs_todo/data/models/event_model.dart';
import 'package:udevs_todo/ui/event_details/widget/header_widget.dart';
import 'package:udevs_todo/utils/colors.dart';
import 'package:udevs_todo/widgets/global_elevated_button.dart';

class EventDetailsSccreen extends StatelessWidget {
  const EventDetailsSccreen({super.key, required this.eventModel});
  final EventModel eventModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeaderWidget(
            eventModel: eventModel ,
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10),
        child: GlobalElevatedButton(
            isDeletedButton: true,
            backgroundColor: AppColors.c_FEE8E9,
            onTap: () async {
              LocalDatabase.deleteEventById(eventModel.id!);

              Navigator.pop(context);
            },
            text: "Delete Event"),
      ),
    );
  }
}

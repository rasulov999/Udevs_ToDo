import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:udevs_todo/data/models/event_model.dart';
import 'package:udevs_todo/ui/home/bloc/get_events_bloc.dart';
import 'package:udevs_todo/ui/update_event/bloc/update_task_bloc.dart';
import 'package:udevs_todo/utils/colors.dart';
import 'package:udevs_todo/utils/form_status.dart';
import 'package:udevs_todo/utils/icons.dart';
import 'package:udevs_todo/widgets/global_elevated_button.dart';
import 'package:udevs_todo/widgets/textfield_with_title.dart';

class UpdateEventScreen extends StatefulWidget {
  const UpdateEventScreen({super.key, required this.eventModel});
  final EventModel eventModel;

  @override
  State<UpdateEventScreen> createState() => _UpdateEventScreenState();
}

class _UpdateEventScreenState extends State<UpdateEventScreen> {

  late  TextEditingController nameController=TextEditingController(text: widget.eventModel.name);
  late  TextEditingController descriptionController =
        TextEditingController(text: widget.eventModel.description);
     late TextEditingController locationController =
        TextEditingController(text: widget.eventModel.location);
        TextEditingController newName=TextEditingController();
        TextEditingController timeController=TextEditingController();
        @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset(AppIcons.arrowLeftIcon),
        ),
      ),
      bottomNavigationBar: BlocListener<UpdateTaskBloc, UpdateTaskState>(
        listener: (context, state) {
          if (state.status == Status.updated) {
            BlocProvider.of<GetEventsBloc>(context).add(GetEventsEvent());
            Future.delayed(const Duration(milliseconds: 50))
                .then((value) => Navigator.pop(context));
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10),
          child: GlobalElevatedButton(
              backgroundColor: AppColors.c_009FEE,
              onTap: () {
                BlocProvider.of<UpdateTaskBloc>(context).add(UpdateTask(
                    eventModel: EventModel(
                        name: newName.text,
                        description: descriptionController.text,
                        location: locationController.text)));
              },
              text: "Update"),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            SizedBox(height: 25.h),
            TextfieldWithTitle(
              title: "Event name",
              controller: nameController,
            ),
             SizedBox(height: 20.h),
            TextfieldWithTitle(
              title: "Event description",
              controller: descriptionController,
              linesCount: 5,
            ),
              SizedBox(height: 20.h),
            TextfieldWithTitle(
              title: "Event location",
              controller: locationController,
              isLocation: true,
            ),
            SizedBox(height: 20.h),
            TextfieldWithTitle(
              title: "Event time",
              controller: timeController,
            ),
          ],
        ),
      ),
    );
  }
}

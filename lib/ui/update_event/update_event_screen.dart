import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:udevs_todo/utils/colors.dart';
import 'package:udevs_todo/utils/icons.dart';
import 'package:udevs_todo/widgets/global_elevated_button.dart';
import 'package:udevs_todo/widgets/textfield_with_title.dart';

class UpdateEventScreen extends StatefulWidget {
  const UpdateEventScreen({super.key});

  @override
  State<UpdateEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<UpdateEventScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController locationController = TextEditingController();

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
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10),
        child: GlobalElevatedButton(
            backgroundColor: AppColors.c_009FEE,
            onTap: () async {
            
            },
            text: "Update"),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            TextfieldWithTitle(
              title: "Event name",
              controller: nameController,
            ),
            TextfieldWithTitle(
              title: "Event description",
              controller: descriptionController,
              linesCount: 5,
            ),
            TextfieldWithTitle(
              title: "Event location",
              controller: locationController,
            ),
          ],
        ),
      ),
    );
  }
}

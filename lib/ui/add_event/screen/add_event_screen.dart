import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:udevs_todo/utils/colors.dart';
import 'package:udevs_todo/utils/icons.dart';
import 'package:udevs_todo/widgets/global_elevated_button.dart';
import 'package:udevs_todo/widgets/textfield_with_title.dart';

class AddEventScreen extends StatelessWidget {
  const AddEventScreen({super.key});

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
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: GlobalElevatedButton(
            backgroundColor: AppColors.c_009FEE, onTap: () {}, text: "Add"),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            TextfieldWithTitle(title: "Event name")
          ],
        ),
      ),
    );
  }
}

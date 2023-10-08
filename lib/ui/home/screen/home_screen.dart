import 'package:flutter/material.dart';
import 'package:udevs_todo/ui/home/widget/schedule_button.dart';
import 'package:udevs_todo/utils/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          children: [
            Container(
              height: 260,
              color: Colors.amber,
            ),
            ScheduleButton(
              onTap: () => Navigator.pushNamed(context, addEventScreen),
            ),
          ],
        ),
      ),
    );
  }
}

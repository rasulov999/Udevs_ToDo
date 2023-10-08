import 'package:flutter/material.dart';
import 'package:udevs_todo/data/database/local_database.dart';
import 'package:udevs_todo/data/models/event_model.dart';
import 'package:udevs_todo/ui/home/widget/event_container.dart';
import 'package:udevs_todo/ui/home/widget/schedule_button.dart';
import 'package:udevs_todo/utils/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<EventModel> list=[];

  _init()async{
    list= await LocalDatabase.getEvents();
    setState(() {
      
    });
  }
  @override
  void initState() {
    _init();
    super.initState();
  }
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
            Expanded(child: ListView(
              children: List.generate(list.length, (index) {
                var item= list[index];
                return InkWell(
                  onTap:() => Navigator.pushNamed(context, eventDetailScreen, arguments: item),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: EventContainer(
                      eventModel: item,
                    )
                  ),
                );
              }),
            ),),
          ],
        ),
      ),
    );
  }
}

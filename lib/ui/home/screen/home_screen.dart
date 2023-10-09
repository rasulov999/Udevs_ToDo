import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udevs_todo/data/models/event_model.dart';
import 'package:udevs_todo/ui/home/bloc/get_events_bloc.dart';
import 'package:udevs_todo/ui/home/widget/event_container.dart';
import 'package:udevs_todo/ui/home/widget/schedule_button.dart';
import 'package:udevs_todo/utils/colors.dart';
import 'package:udevs_todo/utils/constants.dart';
import 'package:udevs_todo/utils/form_status.dart';
import 'package:udevs_todo/utils/styles.dart';

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
              height: 300,
              color: Colors.amber,
            ),
            ScheduleButton(
              onTap: () => Navigator.pushNamed(context, addEventScreen),
            ),
            Expanded(
              child: BlocBuilder<GetEventsBloc, GetEventsState>(
                builder: (context, state) {
                  if (state.status == Status.loading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state.status == Status.success) {
                    List<EventModel> events = [];
                    return ListView(
                      physics: const BouncingScrollPhysics(),
                      children:
                          List.generate(state.eventModel!.length, (index) {
                        var item = state.eventModel![index];
                        events = (state.eventModel!).reversed.toList();
                        return InkWell(
                          onTap: () => Navigator.pushNamed(
                              context, eventDetailScreen,
                              arguments: item),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: EventContainer(
                              eventModel: events[index],
                            ),
                          ),
                        );
                      }),
                    );
                  } else {
                    return Center(
                      child: Text(
                        "No tasks",
                        style: AppTextStyles.style16w600
                            .copyWith(color: AppColors.black),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udevs_todo/data/models/event_model.dart';
import 'package:udevs_todo/ui/add_event/bloc/add_event_bloc_bloc.dart';
import 'package:udevs_todo/ui/add_event/screen/add_event_screen.dart';
import 'package:udevs_todo/ui/event_details/bloc/delete_event_bloc_bloc.dart';
import 'package:udevs_todo/ui/event_details/screen/event_details_screen.dart';
import 'package:udevs_todo/ui/home/screen/home_screen.dart';
import 'package:udevs_todo/ui/update_event/update_event_screen.dart';
import 'package:udevs_todo/utils/constants.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeScreen:
        return navigateTo(HomeScreen());
       case addEventScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AddEventBlocBloc(),
            child: AddEventScreen()
          ),
        );
      case eventDetailScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => DeleteEventBlocBloc(),
            child: EventDetailsSccreen(
              eventModel: settings.arguments as EventModel,
            ),
          ),
        );
      case updateEventScreen:
        return navigateTo(UpdateEventScreen());
    }
    return null;
  }
}

MaterialPageRoute navigateTo(Widget widget) =>
    MaterialPageRoute(builder:(context) => widget,);

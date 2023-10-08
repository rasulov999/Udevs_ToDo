import 'package:flutter/material.dart';
import 'package:udevs_todo/ui/add_event/screen/add_event_screen.dart';
import 'package:udevs_todo/ui/event_details/screen/event_details_screen.dart';
import 'package:udevs_todo/ui/home/screen/home_screen.dart';
import 'package:udevs_todo/utils/constants.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeScreen:
        return navigateTo(HomeScreen());
      case addEventScreen:
        return navigateTo(AddEventScreen());
      // case editScreen:
      //   return navigateTo(EventEditScreen(eventModel:  settings.arguments as EventModel,));
      // case detailScreen:
      //   return navigateTo(EventDetailScreen(eventModel: settings.arguments as EventModel,));
      case eventDetailScreen:
        return navigateTo(EventDetailsSccreen());
      default:
        return navigateTo(
          Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}

MaterialPageRoute navigateTo(Widget widget) => MaterialPageRoute(
      builder: (context) => widget,
    );

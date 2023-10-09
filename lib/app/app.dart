import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udevs_todo/router/app_router.dart';
import 'package:udevs_todo/ui/home/bloc/get_events_bloc.dart';
import 'package:udevs_todo/utils/constants.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => GetEventsBloc()..add(GetEventsEvent())),
      
    ], child: MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        splitScreenMode: true,
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: AppRouter.generateRoute,
            initialRoute: homeScreen,
          );
        });
  }
}

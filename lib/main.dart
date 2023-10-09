import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udevs_todo/app/app.dart';
import 'package:udevs_todo/app/bloc_observer.dart';
import 'package:udevs_todo/utils/tools/get_it.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // await StorageRepository.getInstance();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
    ),
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  Bloc.observer = AppBlocObserver();
   setup();
  runApp(const App());
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:udevs_todo/app/app.dart';

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
  // Bloc.observer = AppBlocObserver();
  runApp(const App());
}

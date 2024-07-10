import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marvel/drivers/injects/injects.dart';
import 'package:marvel/presentation/views/app_view.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    )
  );

  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp
    ]
  );

  Inject.init();
  
  runApp(const AppView());
}
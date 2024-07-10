import 'package:flutter/material.dart';
import 'package:marvel/presentation/views/pages/splash_page/splash_page.dart';
import 'package:marvel/presentation/views/utils/consts_util.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Marvel App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        primaryColor: ConstsUtils.primaryColor
      ),
      home: const SplashPage(),
    );
  }
}
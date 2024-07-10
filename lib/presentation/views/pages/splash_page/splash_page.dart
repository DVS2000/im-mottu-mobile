import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel/presentation/components/custom_button_component.dart';
import 'package:marvel/presentation/views/pages/home_page/home_page.dart';
import 'package:marvel/presentation/views/utils/consts_util.dart';
import 'package:marvel/presentation/views/utils/size_extesion_util.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {

    _timer = Timer.periodic(
      const Duration(milliseconds: 3000),
      (timer) {
        if(mounted) {
          setState(
            () => _currentIndex = _currentIndex + 1 == ConstsUtils.imgsCarrousel.length ? 0 : _currentIndex + 1
          );
        }

      }
    );

    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: context.sizedDevice.height,
        width: context.sizedDevice.height,
        child: Stack(
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 2500),
              child: Image.asset(
                ConstsUtils.imgsCarrousel[_currentIndex],
                height: context.sizedDevice.height,
                width: context.sizedDevice.width,
                fit: BoxFit.cover,
                key: ValueKey<int>(_currentIndex),
              ),
            ),

            Container(
              height: context.sizedDevice.height,
              width: context.sizedDevice.width,
              padding: const EdgeInsets.symmetric(
                horizontal: ConstsUtils.defaultPadding,
                vertical: 30
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.white.withOpacity(.8),
                    Colors.white
                  ]
                )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    ConstsUtils.logo
                  ),

                  Text(
                    "Descubra o Universo Marvel",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: context.sizedDevice.height / 30,
                      fontFamily: ConstsUtils.fBold
                    ),
                  ),

                  Text(
                    "Explore as histórias, poderes e aventuras dos seus heróis favoritos em um só lugar.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: context.sizedDevice.height / 50,
                      fontFamily: ConstsUtils.fRegular
                    ),
                  ),
                  const SizedBox(height: 20,),

                  CustomButtonComponent(
                    title: "Começar a Aventura",
                    onTap: () => Get.to(const HomePage()),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
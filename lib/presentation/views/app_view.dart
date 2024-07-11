import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel/presentation/views/pages/splash_page/splash_page.dart';
import 'package:marvel/presentation/views/utils/consts_util.dart';
import 'package:path_provider/path_provider.dart';

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView>  with WidgetsBindingObserver {

  void clearCache() async {
    final dir = await getTemporaryDirectory();
    final store = HiveCacheStore(dir.path);
    await store.clean();
  }


  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.detached) {
      // QUANDO O APLICATIVO É FECHADO TENHO QUE LIMPAR TODO CACHE
      clearCache();
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Marvel App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        primaryColor: ConstsUtils.primaryColor
      ),
      home: const SplashPage(),
    );
  }
}
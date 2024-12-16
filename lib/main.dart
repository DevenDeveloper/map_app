import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_app/core/di_service/di_services.dart';

import 'core/route/route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Map App",
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBinding(),
      defaultTransition: Transition.noTransition,
      transitionDuration: const Duration(milliseconds: 200),
      initialRoute: RouteHelper.splashScreen,
      navigatorKey: Get.key,
      getPages: RouteHelper().routes,
    );
  }
}

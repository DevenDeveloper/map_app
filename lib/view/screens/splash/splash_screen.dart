import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_app/core/utils/images.dart';
import 'package:map_app/data/controller/splash/splash_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: GetBuilder<SplashController>(
                builder: (controller) => Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FadeTransition(
                          opacity: controller.fadeAnimation,
                          child: SlideTransition(
                            position: controller.slideAnimation,
                            child: Image.asset(MyImages.appLogo, height: 90),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Center(
                          child: FadeTransition(
                            opacity: controller.fadeAnimation,
                            child: SlideTransition(
                              position: controller.slideAnimation,
                              child:
                                  Image.asset(MyImages.appTagLine, height: 44),
                            ),
                          ),
                        ),
                      ],
                    ))));
  }

}

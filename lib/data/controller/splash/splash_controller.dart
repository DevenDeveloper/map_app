import 'package:flutter/animation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:map_app/core/route/route.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashController extends GetxController with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> fadeAnimation;
  late Animation<Offset> slideAnimation;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    fadeAnimation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    );

    slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOut,
      ),
    );

    animationController.forward();

    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        gotoNextPage();
      }
    });
    gotoNextPage();
  }

  gotoNextPage() async {
    Future.delayed(const Duration(seconds: 2), () async {

      final sharedPreferences = await SharedPreferences.getInstance();
      bool isLoggedIn = sharedPreferences.getBool('isLoggedIn') ?? false;
      if (isLoggedIn){
        Get.offAndToNamed(RouteHelper.profileScreen);
      } else {
        Get.offAndToNamed(RouteHelper.loginScreen);
      }
    });
    update();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}

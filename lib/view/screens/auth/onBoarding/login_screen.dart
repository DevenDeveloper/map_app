import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_app/core/utils/dimensions.dart';
import 'package:map_app/core/utils/local_strings.dart';
import 'package:map_app/data/controller/auth/login/login_controller.dart';
import 'package:map_app/view/screens/auth/onBoarding/components/header.dart';
import 'package:map_app/view/screens/auth/onBoarding/components/login_form.dart';
import 'package:map_app/view/screens/auth/onBoarding/components/mobile_login_form.dart';
import 'package:map_app/view/screens/auth/onBoarding/components/screen_title.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: GetBuilder<LoginController>(
          builder: (controller) => SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Dimensions.space60),
                Header(),
                LoginTitle(title: LocalStrings.login.tr, subtitle: LocalStrings.loginDesc.tr),
                LoginForm(controller: controller),
                MobileLoginForm(controller: controller),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

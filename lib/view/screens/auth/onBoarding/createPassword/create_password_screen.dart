import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_app/core/utils/dimensions.dart';
import 'package:map_app/core/utils/local_strings.dart';
import 'package:map_app/data/controller/auth/password/password_controller.dart';
import 'package:map_app/view/screens/auth/onBoarding/components/header.dart';
import 'package:map_app/view/screens/auth/onBoarding/createPassword/password_form.dart';
import 'package:map_app/view/screens/auth/onBoarding/components/screen_title.dart';

class CreatePasswordScreen extends StatelessWidget {
  const CreatePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: GetBuilder<PasswordController>(
          builder: (controller) => SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: Dimensions.space60),
                const Header(),
                LoginTitle(title: LocalStrings.createPassword.tr, subtitle: LocalStrings.createPasswordDesc.tr),
                const SizedBox(height: Dimensions.space20),
                PasswordForm(controller: controller),
              ],
            ),
          ),
        ),
      ),
    );
  }

}

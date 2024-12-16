import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_app/core/utils/dimensions.dart';
import 'package:map_app/core/utils/local_strings.dart';
import 'package:map_app/data/controller/auth/createProfile/create_profile_controller.dart';
import 'package:map_app/view/screens/auth/onBoarding/createProfile/create_profile_form.dart';
import 'package:map_app/view/screens/auth/onBoarding/components/header.dart';
import 'package:map_app/view/screens/auth/onBoarding/components/screen_title.dart';

class CreateProfileScreen extends StatelessWidget {
  const CreateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: GetBuilder<CreateProfileController>(
          builder: (controller) => SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: Dimensions.space60),
                const Header(),
                LoginTitle(title: LocalStrings.createProfile.tr, subtitle: LocalStrings.createProfileDesc.tr),
                const SizedBox(height: Dimensions.space20),
                CreateProfileForm(controller: controller),
              ],
            ),
          ),
        ),
      ),
    );
  }

}

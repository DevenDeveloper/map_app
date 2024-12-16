
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_app/core/helper/UserPreferences.dart';
import 'package:map_app/core/route/route.dart';
import 'package:map_app/core/utils/local_strings.dart';
import 'package:map_app/data/controller/auth/createProfile/create_profile_controller.dart';

class Menus extends StatelessWidget {
  const Menus({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (value) async {
        if (value == 'logout') {
          UserPreferences.removeUser();

          Get.find<CreateProfileController>().clearTextField();
          Get.offAndToNamed(RouteHelper.loginScreen);
        } else if (value == 'edit_profile') {
          Get.toNamed(RouteHelper.createProfileScreen);
        }
      },
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem(
            value: 'edit_profile',
            child: Text(LocalStrings.editProfile.tr),
          ),
          PopupMenuItem(
            value: 'logout',
            child: Text(LocalStrings.logout.tr),
          ),
        ];
      },
    );
  }
}

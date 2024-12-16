import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_app/core/utils/color_resources.dart';
import 'package:map_app/core/utils/dimensions.dart';
import 'package:map_app/core/utils/local_strings.dart';
import 'package:map_app/core/utils/style.dart';
import 'package:map_app/data/controller/auth/profile/profile_controller.dart';
import 'package:map_app/view/screens/auth/onBoarding/components/header.dart';
import 'package:map_app/view/screens/auth/onBoarding/components/screen_title.dart';
import 'package:map_app/view/screens/auth/onBoarding/profle/menus.dart';

import 'user_detail_row.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 2,
          title: Row(
            children: [
              Header(
                firstImageHeight: 38,
                secondImageHeight: 28,
              ),
              const Spacer(),
              const Menus(),
            ],
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: GetBuilder<ProfileController>(
          builder: (controller) {
            if (controller.isLoading) {
              return Center(
                child: CupertinoActivityIndicator(
                  color: ColorResources.primaryColor,
                ),
              );
            }

            if (controller.user == null) {
              return Center(
                child: Text(
                  'No user data available.',
                  style: mediumMediumLarge.copyWith(color: Colors.red),
                ),
              );
            }

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Dimensions.space15,
                  vertical: Dimensions.space15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LoginTitle(
                      title: LocalStrings.login.tr,
                      subtitle: LocalStrings.profileDesc.tr,
                    ),
                    const SizedBox(height: Dimensions.space20),

                    UserDetailRow(
                      label: 'Full Name',
                      value:
                      '${controller.user!.firstName} ${controller.user!.lastName}',
                    ),
                    UserDetailRow(
                      label: controller.user!.mobileNo.isEmpty
                          ? 'Email'
                          : 'Mobile No',
                      value: controller.user!.mobileNo.isEmpty
                          ? controller.user!.email
                          : controller.user!.mobileNo,
                    ),
                    UserDetailRow(
                      label: 'Date of Birth',
                      value: controller.user!.dob,
                    ),
                    UserDetailRow(
                      label: 'Location',
                      value: controller.user!.currentLocation,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:map_app/core/utils/color_resources.dart';
import 'package:map_app/core/utils/dimensions.dart';
import 'package:map_app/core/utils/local_strings.dart';
import 'package:map_app/data/controller/auth/createProfile/create_profile_controller.dart';
import 'package:map_app/view/component/button/rounded_button.dart';
import 'package:map_app/view/component/button/rounded_loading_button.dart';
import 'package:map_app/view/component/text-form-field/custom_text_field.dart';
import 'package:get/get.dart';

class CreateProfileForm extends StatelessWidget {
  final CreateProfileController controller;

  const CreateProfileForm({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
      padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16),
      child: Form(
        key: controller.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              animatedLabel: true,
              needOutlineBorder: true,
              controller: controller.firstNameController,
              labelText: LocalStrings.firstName,
              onChanged: (value) {},
              focusNode: controller.firstNameFocusNode,
              nextFocus: controller.lastNameFocusNode,
              textInputType: TextInputType.name,
              inputAction: TextInputAction.next,
              validator: (value) =>
                  controller.validateFirstName(value as String?),
            ),
            const SizedBox(height: Dimensions.space20),
            CustomTextField(
                animatedLabel: true,
                needOutlineBorder: true,
                controller: controller.lastNameController,
                labelText: LocalStrings.lastName,
                onChanged: (value) {},
                focusNode: controller.lastNameFocusNode,
                textInputType: TextInputType.name,
                inputAction: TextInputAction.next,
                validator: (value) =>
                    controller.validateLastName(value as String?)),
            const SizedBox(height: Dimensions.space20),
            GestureDetector(
              onTap: () {
                controller.selectDate(context);
              },
              child: CustomTextField(
                  animatedLabel: true,
                  needOutlineBorder: true,
                  controller: controller.dobController,
                  labelText: LocalStrings.dob,
                  onChanged: (value) {},
                  readOnly: true,
                  isEnable: false,
                  validator: (value) =>
                      controller.validateDateOfBirth(value as String?)),
            ),
            const SizedBox(height: Dimensions.space20),
            GestureDetector(
              onTap: controller.getCurrentLocation,
              child: Stack(
                children: [
                  CustomTextField(
                    animatedLabel: true,
                    needOutlineBorder: true,
                    controller: controller.currentLocationController,
                    labelText: LocalStrings.currentLocation,
                    onChanged: (value) {},
                    readOnly: true,
                    isEnable: false,
                    validator: (value) =>
                        controller.validateLocation(value as String?),
                  ),
                  if (controller.isLoading)
                    Positioned.fill(
                      child: Center(
                        child: CupertinoActivityIndicator(
                          color: ColorResources.primaryColor,
                        ), // Loader
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: Dimensions.space20),
            controller.isSubmitLoading
                ? const RoundedLoadingBtn()
                : RoundedButton(
                    text: LocalStrings.submit.tr,
                    press: () {
                      if (controller.formKey.currentState!.validate()) {
                        controller.onSubmit();
                      }
                    },
                  )
          ],
        ),
      ),
    );
  }
}

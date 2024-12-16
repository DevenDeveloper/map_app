import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_app/core/utils/dimensions.dart';
import 'package:map_app/core/utils/local_strings.dart';
import 'package:map_app/core/utils/style.dart';
import 'package:map_app/data/controller/auth/login/login_controller.dart';
import 'package:map_app/view/component/text-form-field/custom_text_field.dart';
import 'package:map_app/view/screens/auth/onBoarding/components/login_button.dart';

class MobileLoginForm extends StatelessWidget {
  final LoginController controller;

  const MobileLoginForm({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Form(
        key: controller.formKeyMobile,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: Dimensions.space20),
            _buildDividerWithText(context),
            const SizedBox(height: Dimensions.space10),
            Text(
              LocalStrings.loginWithOtp.tr,
              style: regularDefault.copyWith(
                fontSize: Dimensions.fontDefault,
              ),
            ),
            const SizedBox(height: Dimensions.space20),
            CustomTextField(
              animatedLabel: true,
              needOutlineBorder: true,
              controller: controller.mobileController,
              labelText: LocalStrings.mobileNumber.tr,
              onChanged: (value) {},
              focusNode: controller.mobileFocusNode,
              textInputType: TextInputType.phone,
              inputAction: TextInputAction.done,
              validator: (value) => controller.validateMobile(value as String?),
            ),
            const SizedBox(height: Dimensions.space20),
            LoginButton(
                controller: controller,
                text: LocalStrings.submit.tr,
                onPress: () {
                  if (controller.formKeyMobile.currentState!.validate()) {
                    controller.loginWithOtp();
                  }
                }),
            const SizedBox(height: Dimensions.space20),
          ],
        ),
      ),
    );
  }

  Widget _buildDividerWithText(BuildContext context) {
    return Row(
      spacing: 8,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(child: Divider()),
        Text(
          LocalStrings.or.tr,
          style: regularDefault.copyWith(
            color: Theme.of(context).textTheme.bodyMedium!.color!,
          ),
        ),
        const Expanded(child: Divider()),
      ],
    );
  }

}

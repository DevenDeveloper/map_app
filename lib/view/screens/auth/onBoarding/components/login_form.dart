import 'package:flutter/material.dart';
import 'package:map_app/core/utils/dimensions.dart';
import 'package:map_app/core/utils/local_strings.dart';
import 'package:map_app/data/controller/auth/login/login_controller.dart';
import 'package:map_app/view/component/text-form-field/custom_text_field.dart';
import 'package:get/get.dart';
import 'package:map_app/view/screens/auth/onBoarding/components/login_button.dart';

class LoginForm extends StatelessWidget {
  final LoginController controller;

  const LoginForm({required this.controller, super.key});

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
              controller: controller.emailController,
              labelText: LocalStrings.email,
              onChanged: (value) {},
              focusNode: controller.emailFocusNode,
              nextFocus: controller.passwordFocusNode,
              textInputType: TextInputType.emailAddress,
              inputAction: TextInputAction.next,
              validator: (value) => controller.validateEmail(value as String?),
            ),
            const SizedBox(height: Dimensions.space12),
            CustomTextField(
              animatedLabel: true,
              needOutlineBorder: true,
              labelText: LocalStrings.password.tr,
              controller: controller.passwordController,
              focusNode: controller.passwordFocusNode,
              onChanged: (value) {},
              isShowSuffixIcon: true,
              isPassword: true,
              textInputType: TextInputType.text,
              inputAction: TextInputAction.done,
              validator: (value) =>
                  controller.validatePassword(value as String?),
            ),
            const SizedBox(height: Dimensions.space20),
            LoginButton(
                controller: controller,
                text: LocalStrings.signIn.tr,
                onPress: () {
                  if (controller.formKey.currentState!.validate()) {
                    controller.loginUser();
                  }
                }),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:map_app/core/utils/dimensions.dart';
import 'package:map_app/core/utils/local_strings.dart';
import 'package:map_app/data/controller/auth/password/password_controller.dart';
import 'package:map_app/view/component/button/rounded_button.dart';
import 'package:map_app/view/component/button/rounded_loading_button.dart';
import 'package:map_app/view/component/text-form-field/custom_text_field.dart';
import 'package:get/get.dart';

class PasswordForm extends StatelessWidget {
  final PasswordController controller;

  const PasswordForm({required this.controller, super.key});

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

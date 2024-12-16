import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_app/core/route/route.dart';
import 'package:map_app/core/utils/field_validation.dart';
import 'package:map_app/core/utils/local_strings.dart';

class PasswordController extends GetxController {
  final passwordFocusNode = FocusNode();

  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool isSubmitLoading = false;

  String? validatePassword(String? value) {
    if (value!.isEmpty) return LocalStrings.fieldErrorMsg.tr;
    if (value.toString().length < 6 || value.toString().length > 15) return LocalStrings.passwordFieldErrorMsg.tr;
    return null;
  }


  void onSubmit() async {
    isSubmitLoading = true;
    update();
    Get.offAndToNamed(RouteHelper.createProfileScreen, arguments: [Get.arguments[0]]);
    isSubmitLoading = false;
    update();
  }

  void clearTextField() {
    passwordController.text = '';
    update();
  }
}

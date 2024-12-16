import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_app/core/route/route.dart';
import 'package:map_app/core/utils/field_validation.dart';
import 'package:map_app/core/utils/local_strings.dart';

class LoginController extends GetxController {
  final emailFocusNode = FocusNode();
  final mobileFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final formKeyMobile = GlobalKey<FormState>();

  LoginController();

  bool isSubmitLoading = false;

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return LocalStrings.fieldErrorMsg.tr;
    if (!FieldValidation().isValidEmail(value)) return LocalStrings.emailErrorMsg.tr;
    return null;
  }

  String? validatePassword(String? value) {
    if (value!.isEmpty) return LocalStrings.fieldErrorMsg.tr;
    if (value.toString().length < 6 || value.toString().length > 15) return LocalStrings.passwordFieldErrorMsg.tr;
    return null;
  }

  String? validateMobile(String? value) {
    if (value!.isEmpty) return LocalStrings.fieldErrorMsg.tr;
    if (value.toString().length != 10) return LocalStrings.mobileFieldErrorMsg.tr;
    return null;
  }

  void loginUser() async {
    isSubmitLoading = true;
    update();
    Get.toNamed(RouteHelper.otpScreen, arguments: [emailController.text.toString(), passwordController.text.toString()]);

    isSubmitLoading = false;
    update();
  }

  void loginWithOtp() async {
    isSubmitLoading = true;
    update();
    Get.toNamed(RouteHelper.otpScreen, arguments: [mobileController.text.toString()]);

    isSubmitLoading = false;
    update();
  }

  void clearTextField() {
    passwordController.text = '';
    emailController.text = '';
    update();
  }
}

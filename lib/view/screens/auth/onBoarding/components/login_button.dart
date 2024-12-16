import 'package:flutter/material.dart';
import 'package:map_app/view/component/button/rounded_button.dart';
import 'package:map_app/view/component/button/rounded_loading_button.dart';
import 'package:map_app/data/controller/auth/login/login_controller.dart';

class LoginButton extends StatelessWidget {
  final LoginController controller;
  final String text;
  final VoidCallback onPress;

  const LoginButton({super.key, required this.controller, required this.text, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return controller.isSubmitLoading
        ? const RoundedLoadingBtn()
        : RoundedButton(text: text, press: onPress);
  }
}

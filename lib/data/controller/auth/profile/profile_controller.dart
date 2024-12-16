import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_app/core/helper/UserPreferences.dart';
import 'package:map_app/core/route/route.dart';
import 'package:map_app/core/utils/field_validation.dart';
import 'package:map_app/core/utils/local_strings.dart';
import 'package:map_app/data/model/auth/user_model.dart';

class ProfileController extends GetxController {
  UserModel? user;
  bool isLoading = true;

  @override
  void onInit() {
    super.onInit();
    loadUser();
  }

  @override
  void onReady() {
    super.onReady();
    loadUser();
  }

  Future<void> loadUser() async {
    await UserPreferences.getUser().then((value) {
      user = value;
      isLoading = false;
      update();
      print('User :: ${user?.lastName}');
    });
  }
}

import 'dart:async';

import 'package:get/get.dart';
import 'package:map_app/core/route/route.dart';
import 'package:map_app/core/utils/local_strings.dart';

class OtpController extends GetxController {
  OtpController();

  bool isButtonEnabled = true;
  String timerText = '';
  late Timer _timer;
  int _counter = 30;

  bool isSubmitLoading = false;

  @override
  void onInit() {
    super.onInit();
    onRequestAgain();
  }

  void onSubmit(otp) async {
    isSubmitLoading = true;
    update();
    if (otp.toString() == "123456") {
      if (Get.arguments.length > 1) {
        Get.offNamed(RouteHelper.createProfileScreen,
            arguments: [Get.arguments[0], Get.arguments[1]]);
      } else {
        Get.offNamed(RouteHelper.passwordScreen,
            arguments: [Get.arguments[0]]);
      }
    } else {
      Get.snackbar(
        LocalStrings.otp,
        LocalStrings.otpError,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    isSubmitLoading = false;
    update();
  }

  void onRequestAgain() {
    isButtonEnabled = false;
    timerText = ' ($_counter)';
    update();

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _counter--;
      timerText = ' ($_counter)';
      update();

      if (_counter == 0) {
        _timer.cancel();
        isButtonEnabled = true;
        timerText = '';
        _counter = 30;
        update();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }
}

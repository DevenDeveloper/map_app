import 'package:get/get.dart';
import 'package:map_app/data/controller/auth/createProfile/create_profile_controller.dart';
import 'package:map_app/data/controller/auth/login/login_controller.dart';
import 'package:map_app/data/controller/auth/otp/otp_controller.dart';
import 'package:map_app/data/controller/auth/password/password_controller.dart';
import 'package:map_app/data/controller/auth/profile/profile_controller.dart';
import 'package:map_app/data/controller/splash/splash_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitialBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.put(SplashController());

    Get.put(LoginController());
    Get.put(OtpController());
    Get.put(PasswordController());
    Get.put(CreateProfileController());
    Get.put(ProfileController());
    final sharedPreferences = await SharedPreferences.getInstance();
    Get.lazyPut(() => sharedPreferences, fenix: true);
    bool isLoggedIn = sharedPreferences.getBool('isLoggedIn') ?? false;

  }
}

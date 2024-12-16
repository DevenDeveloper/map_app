
import 'package:get/get.dart';
import 'package:map_app/view/screens/auth/onBoarding/createPassword/create_password_screen.dart';
import 'package:map_app/view/screens/auth/onBoarding/createProfile/create_profile_screen.dart';
import 'package:map_app/view/screens/auth/onBoarding/login_screen.dart';
import 'package:map_app/view/screens/auth/onBoarding/otp/otp_screen.dart';
import 'package:map_app/view/screens/auth/onBoarding/profle/profile_screen.dart';
import 'package:map_app/view/screens/splash/splash_screen.dart';

class RouteHelper {
  static const String splashScreen = "/splash_screen";
  static const String loginScreen = "/login_screen";
  static const String otpScreen = "/otp_screen";
  static const String passwordScreen = "/create_password_screen";
  static const String createProfileScreen = "/create_profile_screen";
  static const String profileScreen = "/profile_screen";

  List<GetPage> routes = [
    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(name: loginScreen, page: () => const LoginScreen()),
    GetPage(name: otpScreen, page: () => const OtpScreen()),
    GetPage(name: passwordScreen, page: () => const CreatePasswordScreen()),
    GetPage(name: createProfileScreen, page: () => const CreateProfileScreen()),
    GetPage(name: profileScreen, page: () => const ProfileScreen()),
  ];
}

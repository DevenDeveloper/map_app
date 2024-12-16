import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:map_app/core/helper/UserPreferences.dart';
import 'package:map_app/core/route/route.dart';
import 'package:map_app/core/utils/color_resources.dart';
import 'package:map_app/core/utils/local_strings.dart';
import 'package:geolocator/geolocator.dart';
import 'package:map_app/data/controller/auth/profile/profile_controller.dart';
import 'package:map_app/data/model/auth/user_model.dart';

class CreateProfileController extends GetxController {
  final firstNameFocusNode = FocusNode();
  final lastNameFocusNode = FocusNode();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final dobController = TextEditingController();
  final currentLocationController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool isSubmitLoading = false;
  UserModel? user;

  @override
  void onInit() {
    super.onInit();
    loadUser();
  }

  Future<void> loadUser() async {
    await UserPreferences.getUser().then((value) {
      user = value;
      firstNameController.text = user!.firstName.toString();
      lastNameController.text = user!.lastName.toString();
      dobController.text = user!.dob.toString();
      currentLocationController.text = user!.currentLocation.toString();
      update();
    });
  }
  String? validateFirstName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "First name is required.";
    }
    if (!RegExp(r"^[a-zA-Z]+$").hasMatch(value.trim())) {
      return "Enter a valid first name.";
    }
    return null;
  }

  String? validateLastName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Last name is required.";
    }
    if (!RegExp(r"^[a-zA-Z]+$").hasMatch(value.trim())) {
      return "Enter a valid last name.";
    }
    return null;
  }

  String? validateDateOfBirth(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Date of birth is required.";
    }
    if (!RegExp(r"^\d{2}/\d{2}/\d{4}$").hasMatch(value.trim())) {
      return "Enter a valid date of birth (dd/MM/yyyy).";
    }
    return null;
  }

  String? validateLocation(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Location is required.";
    }
    return null;
  }

  bool isLoading = false;
  String location = "location";

  Future<void> getCurrentLocation() async {
    isLoading = true;
    update();
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          location = "Location permissions are denied.";
          isLoading = false;
          update();
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        location =
            "Location permissions are permanently denied. Please enable them in settings.";
        isLoading = false;
        update();
        return;
      }

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      Placemark place = placemarks[0];

      location =
          "${place.street}, ${place.locality.toString()}, ${place.administrativeArea.toString()}, ${place.country.toString()} - ${place.postalCode.toString()}";
      currentLocationController.text = location.toString();
      isLoading = false;
      update();
    } catch (e) {
      location = "Failed to get location: $e";
      isLoading = false;
      update();
    }
  }

  String? validatePassword(String? value) {
    if (value!.isEmpty) return LocalStrings.fieldErrorMsg.tr;
    if (value.toString().length < 6 || value.toString().length > 15) {
      return LocalStrings.passwordFieldErrorMsg.tr;
    }
    return null;
  }

  DateTime? selectedDate;

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1800),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: ColorResources.primaryColor,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: ColorResources.primaryColor,
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      dobController.text = '${selectedDate!.day.toString().padLeft(2, '0')}/'
          '${selectedDate!.month.toString().padLeft(2, '0')}/'
          '${selectedDate!.year}';
      update();
    }
  }

  void onSubmit() async {
    isSubmitLoading = true;
    if (formKey.currentState!.validate()) {
      var email, mobileNo;
      if (Get.arguments == null) {
        email = user?.email.toString();
        mobileNo = user?.mobileNo.toString();
      } else {
        email = Get.arguments.length > 1 ? Get.arguments[0] : '';
        mobileNo = Get.arguments.length > 1 ? '' : Get.arguments[0];
      }
      UserModel user1 = UserModel(
          id: "1",
          email: email??'',
          mobileNo: mobileNo??'',
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          dob: dobController.text,
          currentLocation: currentLocationController.text,
          password: '');
      await UserPreferences.saveUser(user1);
      await Get.find<ProfileController>().loadUser();
      Get.offAllNamed(RouteHelper.profileScreen);
    }
    isSubmitLoading = false;
  }

  void clearTextField() {
    firstNameController.clear();
    lastNameController.clear();
    dobController.clear();
    currentLocationController.clear();
    update();
  }
}

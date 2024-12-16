import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:map_app/data/model/auth/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static Future<void> saveUser(UserModel user) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('user', jsonEncode(user.toMap()));
      prefs.setBool('isLoggedIn', true);
    } catch (e) {
      if (kDebugMode) {
        print('Error saving user: $e');
      }
    }
  }

  static Future<UserModel?> getUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userString = prefs.getString('user');

      if (userString != null) {
        final userMap = jsonDecode(userString) as Map<String, dynamic>;
        return UserModel.fromMap(userMap);
      }
      return null;
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching user: $e');
      }
      return null;
    }
  }

  static Future<bool> isUserLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  static Future<void> removeUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      prefs.remove('user');
      prefs.remove('isLoggedIn');
    } catch (e) {
      if (kDebugMode) {
        print('Error removing user: $e');
      }
    }
  }
}

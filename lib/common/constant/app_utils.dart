import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class AppUtils {

  String token = "token";

  Future<void> setToken(String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(token, data);
  }

  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String data = prefs.getString(token)??"";
    return data;
  }

  Future<void> setEmail(String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("email", data);
  }

  Future<String> getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String data = prefs.getString("email")??"";
    return data;
  }

  Future<void> setProfilePic(String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("pic", data);
  }

  Future<String> getProfilePic() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String data = prefs.getString("pic")??"";
    return data;
  }

  Future<void> setName(String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("name", data);
  }

  Future<String> getName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String data = prefs.getString("name")??"";
    return data;
  }



  Future logout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove(token);
  }


}

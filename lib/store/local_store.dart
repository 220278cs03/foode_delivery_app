import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/user_model.dart';

class Local_store{
  Future<void> setUser(UserModel userModel) async {
    SharedPreferences store = await SharedPreferences.getInstance();
    store.setString("user", jsonEncode(userModel.toJson()));
  }

  Future<UserModel> getUser() async {
    SharedPreferences store = await SharedPreferences.getInstance();
    String userJson = store.getString("user") ?? "";
    UserModel user = UserModel.fromJson(jsonDecode(userJson));
    return user;
  }

  Future<void> setImage(String image) async {
    SharedPreferences store = await SharedPreferences.getInstance();
    store.setString("image", image);
  }

  Future<String> getImage() async {
    SharedPreferences store = await SharedPreferences.getInstance();
    return store.getString("image") ?? "";
  }
}
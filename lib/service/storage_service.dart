import 'dart:convert';
import 'package:elearning_app_bloc/common/entities/user.dart';
import 'package:elearning_app_bloc/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  late SharedPreferences _prefs;

  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

    Future<bool> setString(String key, bool value) async {
    return await _prefs.setString(key, value as String);
  }

  bool getDeviceFirstOpen() {
    return _prefs.getBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME) ?? false;
  }


  bool getIsLoggedIn() {
    return _prefs.getString(AppConstants.STORAGE_USER_TOKEN_KEY)==null?false:true;
  }

  Future<bool> remove(String key){
    return _prefs.remove(key);
  }

  String getUserToken(){
    return _prefs.getString(AppConstants.STORAGE_USER_TOKEN_KEY) ?? "";
  }

  UserItem? getUserProfile(){

    var profileOffline = _prefs.getString(AppConstants.STORAGE_USER_PROFILE_KEY)??"";
    if (profileOffline.isNotEmpty) {
     return UserItem.fromJson(jsonEncode(profileOffline) as Map<String, dynamic>);
    }
    return UserItem();
  }

  // getUserProfile(){
  //   var profileOffline = _prefs.getString(AppConstants.STORAGE_USER_PROFILE_KEY)??"";
  //   if (profileOffline.isNotEmpty) {
  //   UserItem.fromJson(jsonDecode(profileOffline));
  //   }
  //   return UserItem();
  }


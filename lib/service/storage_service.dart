import 'package:elearning_app_bloc/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  late SharedPreferences _prefs;

  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setBool(String key, bool value) async {
    await _prefs.setBool(key, value);
  }

    Future<bool> setString(String key, bool value) async {
    await _prefs.setString(key, value as String);
  }

  bool getDeviceFirstOpen() {
    return _prefs.getBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME) ?? false;
  }


  bool getIsLoggedIn() {
    return _prefs.getString(AppConstants.STORAGE_USER_PROFILE_KEY)==null?
  }
}

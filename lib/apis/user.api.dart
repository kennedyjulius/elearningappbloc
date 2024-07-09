import 'package:elearning_app_bloc/common/entities/user.dart';

import 'package:elearning_app_bloc/utils/http_util.dart'; // Assuming you have this utility for HTTP requests.

class UserApi {
  Future<dynamic> login({LoginRequestEntity? param, required LoginRequestEntity params}) async {
    try {
      var response = await HttpUtil().post(
        'api/login',
        queryParameters: param?.toJson(),
      );
      return UserLoginResponseEntity(response);
    } catch (e) {
      print('Login failed: $e');
      return null;
    }
  }
}

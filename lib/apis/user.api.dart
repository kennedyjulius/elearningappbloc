import 'package:elearning_app_bloc/common/entities/user.dart';
import 'package:elearning_app_bloc/common/utils/http_util.dart'; // Assuming you have this utility for HTTP requests.

class UserApi {
  Future<dynamic> login({LoginRequestEntity? param}) async {
    try {
      var response = await HttpUtil().post(
        'api/login',
        queryParameters: param?.toJson(),
      );
      return response;
    } catch (e) {
      print('Login failed: $e');
      return null;
    }
  }
}

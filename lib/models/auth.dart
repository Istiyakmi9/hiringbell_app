import 'package:hiringbell/models/constants.dart';

class Auth {
  String password;
  String email;
  String mobile;

  Auth({required this.email, required this.password, required this.mobile});

  factory Auth.fromJson(Map<String, dynamic> data) {
    return Auth(
      email: data['email'] != null ? data['email'].toString() : Constants.empty,
      password: data['password'] != null
          ? data['password'].toString()
          : Constants.empty,
      mobile:
          data['mobile'] != null ? data['mobile'].toString() : Constants.empty,
    );
  }
}

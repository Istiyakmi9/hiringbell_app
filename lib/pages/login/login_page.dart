import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiringbell/pages/common/error_page/error_page.dart';
import 'package:hiringbell/pages/login/login_controller.dart';
import 'package:hiringbell/pages/login/widgets/login_index_page.dart';
import 'package:hiringbell/pages/login/widgets/waiting_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var login = Get.put(LoginController());

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: _prefs,
      builder:
          (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const WaitingPage();
        } else if (snapshot.hasError) {
          return const ErrorPage();
        } else {
          login.checkAutoLogin();
          return const LoginIndexPage();
        }
      },
    );
  }
}

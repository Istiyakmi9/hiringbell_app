import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiringbell/models/navigate.dart';
import 'package:hiringbell/pages/findFriends/findFriends_page.dart';
import 'package:hiringbell/pages/home/home_page.dart';
import 'package:hiringbell/pages/login/login_page.dart';
import 'package:hiringbell/pages/posts/posts_page.dart';
import 'package:hiringbell/pages/profile/profile_page.dart';
import 'package:hiringbell/pages/settings/settings_page.dart';
import 'package:hiringbell/utilities/Util.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Obtain shared preferences.
  preConfigure();
  runApp(const MainApp());
}

Future<void> preConfigure() async {
  var pref = await SharedPreferences.getInstance();
  Util.init(pref);
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  final ColorScheme colorScheme = const ColorScheme(
    // primary: Color.fromRGBO(21, 26, 74, 1),
    primary: Color.fromRGBO(21, 26, 74, 1),
    // <---- I set white color here
    secondary: Color(0x44444444),
    background: Color(0xFFFFFFFF),
    // page background default to all pages
    surface: Color(0xFFFFFFFF),
    // page header background color
    onBackground: Colors.black,
    error: Colors.redAccent,
    onError: Colors.redAccent,
    onPrimary: Colors.black,
    onSecondary: Colors.black,
    //  default text color
    onSurface: Color(0xFF241E30),
    brightness: Brightness.light,
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Navigate.login,
      getPages: [
        GetPage(name: Navigate.profile, page: () => const ProfilePage()),
        GetPage(name: Navigate.home, page: () => const HomePage()),
        GetPage(name: Navigate.settings, page: () => const SettingPage()),
        GetPage(name: Navigate.post, page: () => const PostsPage()),
        GetPage(
            name: Navigate.findFriends, page: () => const FindFriendsPage()),
        GetPage(name: Navigate.login, page: () => const LoginPage()),
      ],

      unknownRoute: GetPage(name: Navigate.login, page: () => const LoginPage()),
      theme: ThemeData(
        colorScheme: colorScheme,
      ),
    );
  }
}

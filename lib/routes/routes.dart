import 'package:cash_book/modules/home/home_screen.dart';
import 'package:cash_book/modules/login/login_screen.dart';
import 'package:cash_book/modules/otp/otp_screen.dart';
import 'package:cash_book/modules/splash/splash_screen.dart';
import 'package:get/get.dart';

class AppRoute {
  
  static const splash = '/';
  static const login = '/login';
  static const otp = '/otp';
  static const home = '/home';

  static String getSplashRoute()=> splash;
  static String getLoginRoute()=> login;
  static String getOtpRoute()=> otp;
  static String getHomeRoute()=>home;

  static List<GetPage> pages = [
    GetPage(name: splash, page: () => SplashScreen()),
    GetPage(name: login, page: () => LoginScreen(),transition: Transition.rightToLeftWithFade, transitionDuration: const Duration(milliseconds: 500)),
    GetPage(name: otp, page: () => OtpScreen(),transition: Transition.rightToLeftWithFade, transitionDuration: const Duration(milliseconds: 500)),
    GetPage(name: home, page: () => HomeScreen(),transition: Transition.rightToLeftWithFade, transitionDuration: const Duration(milliseconds: 500)),
  ];

}
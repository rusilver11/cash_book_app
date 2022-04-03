import 'package:cash_book/routes/route_name.dart';
import 'package:cash_book/modules/home/home_screen.dart';
import 'package:cash_book/modules/login/login_screen.dart';
import 'package:cash_book/modules/otp/otp_screen.dart';
import 'package:cash_book/modules/splash/splash_screen.dart';
import 'package:get/get.dart';

class AppRoute {
  static final pages = [
    GetPage(name: RouteName.splash, page: () => SplashScreen()),
    GetPage(name: RouteName.login, page: () => LoginScreen()),
    GetPage(name: RouteName.otp, page: () => OtpScreen()),
    GetPage(name: RouteName.home, page: () => HomeScreen()),
  ];
}
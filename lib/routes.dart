import 'package:cash_book/page/home/home_screen.dart';
import 'package:cash_book/page/home/home_screen.dart';
import 'package:cash_book/page/login/login_screen.dart';
import 'package:cash_book/page/otp/otp_screen.dart';
import 'package:cash_book/page/splash/splash_screen.dart';
import 'package:cash_book/page/transaction/transaction_screen.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName:(context) => SplashScreen(),
  LoginScreen.routeName:(context) => LoginScreen(),
  OtpScreen.routeName:(context) => OtpScreen(),
  HomeScreen.routeName:(context) => HomeScreen(),
  TransactionScreen.routeName:(context) => TransactionScreen()
};
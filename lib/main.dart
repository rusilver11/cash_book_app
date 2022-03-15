import 'package:cash_book/page/splash/splash_screen.dart';
import 'package:cash_book/routes.dart';
import 'package:cash_book/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fien - Buku Kas',
      theme: theme(),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }

}
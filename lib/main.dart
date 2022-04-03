import 'package:cash_book/core/config/theme.dart';
import 'package:cash_book/routes/route_name.dart';
import 'package:cash_book/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fien - Buku Kas',
      theme: theme(),
      initialRoute: RouteName.splash,
      getPages: AppRoute.pages,
      builder: EasyLoading.init(),
    );
  }

}
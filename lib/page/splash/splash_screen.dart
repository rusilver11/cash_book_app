import 'package:cash_book/page/splash/component/body.dart';
import 'package:flutter/material.dart';
import 'package:cash_book/size_config.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({ Key? key }) : super(key: key);
  static String routeName = '/splash';
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return  Scaffold(
      body: Body(),
    );
  }
}

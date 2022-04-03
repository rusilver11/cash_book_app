import 'package:cash_book/core/config/size_config.dart';
import 'package:flutter/material.dart';
import 'component/body.dart' as splashBody;

class SplashScreen extends StatelessWidget {
  SplashScreen({ Key? key }) : super(key: key);
  //static String routeName = '/splash';
  @override
  Widget build(BuildContext context) {
    //SizeConfig().init(context);
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      body: splashBody.Body(),
    );
  }
}

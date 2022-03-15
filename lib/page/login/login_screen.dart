import 'package:cash_book/components/custom_surfix_icon.dart';
import 'package:cash_book/page/splash/component/body.dart';
import 'package:cash_book/size_config.dart';
import 'package:flutter/material.dart';
import 'package:cash_book/page/login/component/body.dart' as loginBody;
import 'package:cash_book/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({ Key? key }) : super(key: key);
  static String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      onTap: ()=> FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: loginBody.Body()
      ),
    );
  }
}
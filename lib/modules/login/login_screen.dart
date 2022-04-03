import 'package:cash_book/core/config/size_config.dart';
import 'package:flutter/material.dart';
import 'package:cash_book/modules/login/component/body.dart' as loginBody;

class LoginScreen extends StatelessWidget {
  const LoginScreen({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: loginBody.Body()
      ),
    );
  }
}
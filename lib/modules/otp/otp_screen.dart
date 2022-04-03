import 'package:cash_book/core/config/size_config.dart';
import 'package:flutter/material.dart';
import 'component/body.dart' as otpBody;

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> FocusScope.of(context).unfocus(),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: otpBody.Body()
          ),
    );
  }
}

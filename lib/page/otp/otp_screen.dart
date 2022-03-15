import 'package:cash_book/size_config.dart';
import 'package:flutter/material.dart';
import 'component/body.dart' as otpBody;

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);
  static String routeName = '/otp';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      onTap: ()=> FocusScope.of(context).unfocus(),
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
          ),
          body: otpBody.Body()
          ),
    );
  }
}

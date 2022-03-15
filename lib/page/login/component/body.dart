import 'package:cash_book/constants.dart';
import 'package:cash_book/size_config.dart';
import 'package:flutter/material.dart';

import 'login_form.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Text(
                  'Halo dari\nFien - Buku Kas',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(34),
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                const Text(
                  'Kami akan kirim kode OTP\nuntuk memverifikasi nomor telepon kamu.',
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                const LoginForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
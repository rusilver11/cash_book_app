import 'package:cash_book/core/config/constants.dart';
import 'package:cash_book/core/config/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../login_controller.dart';
import 'login_form.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  
  //bool isLoading = true;
  final loginCtrl = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: kDefaultPadding,vertical: kDefaultPadding),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(height: Get.height * 0.04),
                  Text(
                    'Halo dari\nFien - Buku Kas',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 30.0.sp,
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: Get.height * 0.04),
                  const Text(
                    'Kami akan kirim kode OTP\nuntuk memverifikasi nomor telepon kamu.',
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height:Get.height * 0.08),
                  LoginForm()
                ],
              ),
            ),
          ),
        ),
    );
  }
}
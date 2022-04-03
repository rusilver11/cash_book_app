import 'dart:async';
import 'package:cash_book/core/config/constants.dart';
import 'package:cash_book/core/config/size_config.dart';
import 'package:cash_book/modules/login/login_controller.dart';
import 'package:cash_book/modules/otp/otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'otp_form.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final otpCtrl = Get.put(OtpController());

  int timerSecond = 60;
  Timer? timer;

  void _startTimer() {
    timerSecond = 60;
    Timer.periodic(Duration(seconds: 1), (_timer) {
      if (timerSecond > 0) {
        setState(() {
          timerSecond--;
        });
      } else {
        timer?.cancel();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding, vertical: kDefaultPadding),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: Get.height * 0.04),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'Konfirmasi OTP',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 30.0.sp,
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: Get.height * 0.04),
                    Text(
                      'Kode OTP telah dikirim ke nomor WA anda\n${otpCtrl.loginPhone.replaceRange(0, 1, '62')}',
                      textAlign: TextAlign.left,
                    ),
                    buildTimer(),
                  ],
                ),
                SizedBox(height: Get.height * 0.08),
                Container(
                  height: 380.0.hp,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      OtpForm(otpCtrl: otpCtrl),
                      SizedBox(height: Get.height * 0.04),
                      GestureDetector(
                        onTap: () {
                          timerSecond = 60;
                          timer?.cancel();
                        },
                        child: const Text(
                          'Kirim ulang kode OTP',
                          style: TextStyle(
                              color: kTextColor, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      children: [
        const Text('Kode ini akan kadaluarsa dalam '),
        Text('00:${timerSecond.toString()}')
      ],
    );
  }
}

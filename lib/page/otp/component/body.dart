import 'dart:async';

import 'package:cash_book/constants.dart';
import 'package:cash_book/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'otp_form.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
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
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'Konfirmasi OTP',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(40),
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.04),
                    const Text(
                      'Kode OTP telah dikirim ke nomor WA anda\n+62 855 733 xxx',
                      textAlign: TextAlign.left,
                    ),
                    buildTimer(),
                  ],
                ),
                OtpForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.06),
                GestureDetector(
                  onTap: () {
                    timerSecond = 60;
                    timer?.cancel();
                  },
                  child: const Text(
                    'Kirim ulang kode OTP',
                    style: TextStyle(
                        color: kTextColor,
                        fontWeight: FontWeight.w700
                        ),
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

import 'dart:async';
import 'package:cash_book/core/config/constants.dart';
import 'package:cash_book/core/config/size_config.dart';
import 'package:cash_book/data/services/storage_services.dart';
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

  Timer? timer;
  Duration myDuration = Duration(minutes: 5);

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }

  void resetTimer() {
    setState(() {
      timer!.cancel();
      myDuration = Duration(minutes: 5);
    });
    startTimer();
  }

  void setCountDown() {
    final reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        timer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  // void initList() async{
  //   _value = await storageService.readSecureData('phone');
  // }

  @override
  void initState() {
    super.initState();
    startTimer();
    //initList();
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));
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
                      'Kode OTP telah dikirim ke nomor WA anda\n ${otpCtrl.loginPhone.replaceRange(0, 1, '62')}',
                      //${otpCtrl.storagePhone!.replaceRange(0, 1, '62')}',
                      textAlign: TextAlign.left,
                    ),
                    Row(children: [
                      Text('Kode ini akan kadaluarsa dalam '),
                      Text('$minutes:$seconds',
                          style: TextStyle(color: kPrimaryColor))
                    ])
                  ],
                ),
                SizedBox(height: Get.height * 0.08),
                Container(
                  height: 380.0.hp,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      OtpForm(otpCtrl: otpCtrl, timer: timer!),
                      SizedBox(height: Get.height * 0.04),
                      InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: kPrimaryLightColor.withOpacity(0.1),
                        onTap: () async{
                          await otpCtrl.resendOtp();
                          if(otpCtrl.isSuccess.value) return resetTimer(); 
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
}

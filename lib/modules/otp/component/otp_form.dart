import 'dart:async';

import 'package:cash_book/core/config/constants.dart';
import 'package:cash_book/core/library/keyboard.dart';
import 'package:cash_book/core/config/size_config.dart';
import 'package:cash_book/modules/home/home_screen.dart';
import 'package:cash_book/modules/otp/otp_controller.dart';
import 'package:cash_book/widgets/default_button_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({Key? key, required this.otpCtrl, required this.timer}) : super(key: key);
  final OtpController otpCtrl;
  final Timer timer;
  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.otpCtrl.formKey,
      child: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PinCodeTextField(
              appContext: context,
              length: 5,
              keyboardType: TextInputType.number,
              animationType: AnimationType.none,
              controller: widget.otpCtrl.otpController,
              autoDisposeControllers: false,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(10),
                fieldHeight: 80,
                fieldWidth: 60,
                activeColor: Colors.black,
                inactiveColor: Colors.black,
              ),
              validator: (value){
                if(value!.isEmpty){
                  return kOtpNullError;
                }else if(value.length < 5){
                  return kOtpMin;
                }else{
                  return null;
                }
              },
              onChanged: (value) {
                print('Change: $value');
              },
              onCompleted: (value) {
                print('Complete: $value');
              },
            ),
            SizedBox(height: Get.height * 0.15),
            DefaultButtonIcon(
                text: 'Kirim',
                press: () async{
                  //validate n
                  //pass to dashboard
                  KeyboardUtil.hideKeyboard(context);
                  await widget.otpCtrl.verification();
                  if(widget.otpCtrl.isSuccess.value) return widget.timer.cancel();
                  //Navigator.pushNamed(context, HomeScreen.routeName);
                },
                icon: Icons.whatsapp),
          ],
        ),
      ),
    );
  }
}

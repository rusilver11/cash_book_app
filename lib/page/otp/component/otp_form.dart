import 'package:cash_book/components/default_button_icon.dart';
import 'package:cash_book/constants.dart';
import 'package:cash_book/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({ Key? key }) : super(key: key);

  @override
  State<OtpForm> createState() => _OtpFormState();
}


class _OtpFormState extends State<OtpForm> {
FocusNode? pin2FocusNode;
FocusNode? pin3FocusNode;
FocusNode? pin4FocusNode;

void initState(){
 super.initState();
 pin2FocusNode = FocusNode();
 pin3FocusNode = FocusNode();
 pin4FocusNode = FocusNode(); 
}

void dispose(){
 super.dispose();
 pin2FocusNode!.dispose();
 pin3FocusNode!.dispose();
 pin4FocusNode!.dispose();
}

void nextField(String value, FocusNode? focusNode){
  if (value.length == 1) {
    focusNode!.requestFocus();
  }
}


  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children:[
          SizedBox(height: SizeConfig.screenHeight * 0.08),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: getProportionateScreenWidth(72),
                child: TextFormField(
                  autofocus: true,
                  style: const TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) => nextField(value, pin2FocusNode),
                  inputFormatters: [LengthLimitingTextInputFormatter(1)]
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(72),
                child: TextFormField(
                  autofocus: true,
                  focusNode: pin2FocusNode,
                  style: const TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) => nextField(value, pin3FocusNode),
                  inputFormatters: [LengthLimitingTextInputFormatter(1)],
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(72),
                child: TextFormField(
                  autofocus: true,
                  focusNode: pin3FocusNode,
                  style: const TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) => nextField(value, pin4FocusNode),
                  inputFormatters: [LengthLimitingTextInputFormatter(1)]
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(72),
                child: TextFormField(
                  autofocus: true,
                  focusNode: pin4FocusNode,
                  style: const TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value){
                    if(value.length == 1){
                      pin4FocusNode!.unfocus();
                      //check code otp
                    }
                  },
                  inputFormatters: [LengthLimitingTextInputFormatter(1)]
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.15),
          DefaultButtonIcon(
            text: 'Lanjutkan',
            press: (){},
            icon: Icons.whatsapp
            ),
        ],
      ),
    );
  }
}
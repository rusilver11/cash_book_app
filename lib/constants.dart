import 'package:cash_book/size_config.dart';
import 'package:flutter/material.dart';

//Color pallet
const kPrimaryColor = Color(0xFF5F59E1);
const kPrimaryLightColor = Color(0xFFB1ADFF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFB1ADFF), Color(0xFF5F59E1)],
);
const kSecondaryColor = Color.fromRGBO(248, 250, 251, 1);
const kExpenseColor = Color(0xFFFF5A5A);
const kIncomeColor = Color.fromRGBO(31, 188, 146, 1);
const kInactiveColor = Color.fromRGBO(152, 158, 165, 1);
const kTextColor = Color.fromRGBO(33, 37, 47, 1);
const kTextIIColor = Color.fromRGBO(248, 248, 248, 1);
const kAnimationDuration = Duration(milliseconds: 200);

//Form Error
const String kPhoneNumberNullError = 'Tolong masukan nomor telepon';
const String kPhoneNumberError = 'Nomor telepon yang dimasukan salah';

//OTP Input
final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder,
  focusedBorder: outlineInputBorder,
  enabledBorder: outlineInputBorder,
);

OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor)
    );

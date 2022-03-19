import 'package:cash_book/size_config.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
const kExpenseLightColor = Color.fromRGBO(249, 220, 220, 1);
const kIncomeColor = Color.fromRGBO(31, 188, 146, 1);
const kIncomeLightColor = Color.fromRGBO(232, 249, 220, 1);
const kInactiveColor = Color.fromRGBO(152, 158, 165, 1);
const kTextColor = Color.fromRGBO(33, 37, 47, 1);
const kTextIIColor = Color.fromRGBO(248, 248, 248, 1);
const kAnimationDuration = Duration(milliseconds: 200);

const double kDefaultPadding = 20.0;

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
    borderSide: BorderSide(color: Color.fromRGBO(33, 37, 47, 0.65))
    
    );
  
  //format number locale  
  extension CurrencyFormat on num {
    String idrFormat(){
      return NumberFormat.currency(locale: 'id',symbol: 'Rp',decimalDigits: 0, customPattern: 'Rp #,##0.00;Rp -#,##0.00').format(this);
    }
  }
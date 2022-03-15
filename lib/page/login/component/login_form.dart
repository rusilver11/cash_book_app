import 'package:cash_book/components/custom_surfix_icon.dart';
import 'package:cash_book/components/default_button.dart';
import 'package:cash_book/components/default_button_icon.dart';
import 'package:cash_book/components/form_error.dart';
import 'package:cash_book/constants.dart';
import 'package:cash_book/library/keyboard.dart';
import 'package:cash_book/page/otp/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../size_config.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({ Key? key }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _fromKey = GlobalKey<FormState>();
  String? phone;
  
  final List<String?> loginErrors = [];

  // void addError({String? error}){
  //   if(!loginErrors.contains(error)){
  //     setState(() {
  //       loginErrors.add(error);
  //     });
  //   }
  // }

  //   void removeError({String? error}){
  //   if(!loginErrors.contains(error)){
  //     setState(() {
  //       loginErrors.remove(loginErrors);
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _fromKey,
      child: Column(
        children: [
          buildPhoneFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          FormError(errors: loginErrors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButtonIcon(
            text: 'Kirim',
            icon: Icons.whatsapp,
            press: (){
              if(_fromKey.currentState!.validate()){
                _fromKey.currentState!.save();
                KeyboardUtil.hideKeyboard(context);
                Navigator.pushNamed(context, OtpScreen.routeName);
              }
            }
            ),
        ],
      ),
    );
  }

  TextFormField buildPhoneFormField() {
    return TextFormField(
          keyboardType: TextInputType.phone,
          decoration: const InputDecoration(
            labelText: 'No Telepon',
            hintText: 'Masukan nomor telepon',
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
          //validator here
          inputFormatters: [LengthLimitingTextInputFormatter(16)],
          onSaved: (newValue) => phone = newValue,
          onChanged: (value){
            if (value.isNotEmpty){
              setState(() {
                loginErrors.remove(kPhoneNumberNullError);
              });
            }else{
              return null;
            } 
          },
          validator: (value){
            if(value!.isEmpty){
              setState(() {
                loginErrors.add(kPhoneNumberNullError);
              });
              return '';
            }else{
              return null;
            } 
          },
        );
  }
}
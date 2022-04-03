import 'package:cash_book/core/config/constants.dart';
import 'package:cash_book/core/library/keyboard.dart';
import 'package:cash_book/core/config/size_config.dart';
import 'package:cash_book/modules/login/login_controller.dart';
import 'package:cash_book/modules/otp/otp_screen.dart';
import 'package:cash_book/widgets/default_button_icon.dart';
import 'package:cash_book/widgets/form_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final loginCtrl = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Form(
      key: loginCtrl.formKey,
      child: Container(
        height: 370.0.hp,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildPhoneFormField(),
            DefaultButtonIcon(
                text: 'Kirim',
                icon: Icons.whatsapp,
                press: () async {
                  if (loginCtrl.formKey.currentState!.validate()) {
                    KeyboardUtil.hideKeyboard(context);
                    await loginCtrl.login();
                  }
                }),
          ],
        ),
      ),
    );
  }

  TextFormField buildPhoneFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      controller: loginCtrl.phoneController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: const InputDecoration(
        labelText: 'No Telepon',
        hintText: 'Masukan nomor telepon',
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      //validator here
      inputFormatters: [LengthLimitingTextInputFormatter(16)],
      validator: (value) {
        if (value!.isEmpty) {
          return kPhoneNumberNullError;
        } else if (value.length < 10) {
          return kPhoneNumberMin;
        } else if (!value.isNumericOnly) {
          return kPhoneNumberNumOnly;
        } else {
          return null;
        }
      },
    );
  }
}

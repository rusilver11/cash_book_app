import 'package:flutter/material.dart';
import 'package:cash_book/core/config/constants.dart';
import 'package:cash_book/core/config/size_config.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);
  final String? text;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54.0.hp,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)

          ),
          primary: Colors.white,
          backgroundColor: kPrimaryColor
        ),
        onPressed: press as void Function(), //press
        child:Text(
          text!,
          style: TextStyle(
            fontSize: 14.0.sp,
            color: Colors.white,
          ),
        ),
        ),
    );
  }
}

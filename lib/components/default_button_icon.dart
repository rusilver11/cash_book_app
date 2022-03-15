import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';

class DefaultButtonIcon extends StatelessWidget {
  const DefaultButtonIcon({
    Key? key,
    required this.text,
    required this.press,
    required this.icon,
  }) : super(key: key);
  final String? text;
  final Function? press;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: TextButton.icon(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)

          ),
          primary: Colors.white,
          backgroundColor: kPrimaryColor
        ),
        onPressed: press as void Function(), //press
        label:Text(
          text!,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(18),
            color: Colors.white,
          ),
        ),
        icon: Icon(icon),
        ),
    );
  }
}

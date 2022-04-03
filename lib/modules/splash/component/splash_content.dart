import 'package:cash_book/core/config/constants.dart';
import 'package:cash_book/core/config/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key, required this.text, required this.image,
  }) : super(key: key);
  final String? text,image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Spacer(),
        Text(
          'Fien - Buku Kas',
          style: TextStyle(fontSize: 30.0.sp,
          color: kPrimaryColor,
          fontWeight: FontWeight.bold),
        ),
        Text(
          text!,
          textAlign: TextAlign.center
          ),
        const Spacer(flex: 2),
        SvgPicture.asset(image!,
        height: 265.0.hp,
        width: 235.0.wp,)
      ],
    );
  }
}
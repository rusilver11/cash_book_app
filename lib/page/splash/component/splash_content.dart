import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

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
          style: TextStyle(fontSize: getProportionateScreenWidth(36),
          color: kPrimaryColor,
          fontWeight: FontWeight.bold),
        ),
        Text(
          text!,
          textAlign: TextAlign.center
          ),
        const Spacer(flex: 2),
        SvgPicture.asset(image!,
        height: getProportionateScreenHeight(265),
        width: getProportionateScreenWidth(235),)
      ],
    );
  }
}

import 'package:cash_book/core/config/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSurffixIcon extends StatelessWidget {
  const CustomSurffixIcon({ Key? key, required this.svgIcon}) : super(key: key);
  
  final String svgIcon;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        0,
        18.0.wp,
        18.0.wp,
        18.0.wp,
        ),
        child: SvgPicture.asset(
          svgIcon,
          height: 16.0.hp,
        ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cash_book/core/config/size_config.dart';
import 'package:get/get.dart';

class FormError extends StatelessWidget {
  const FormError({ Key? key, required this.errors }) : super(key: key);

final String? errors;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/icons/icon_Error.svg",
          height: 12.0.wp,
          width: 12.0.wp,
        ),
        SizedBox(
          width: 8.0.wp,
        ),
        Text(errors!),
      ],
    );
  }
}



import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SizeConfig {
  static late double screenWidth;
  static late double screenHeight;

  void init(BuildContext context) {
    screenWidth = Get.width;
    screenHeight = Get.height;
  }
}

// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  // 812 is the layout height that designer use
  return (inputHeight / 812.0) * screenHeight;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  // 375 is the layout width that designer use
  return (inputWidth / 375.0) * screenWidth;
}

extension PercentSize on double {
  double get hp  => ((this/812.0)*Get.height);
  double get wp  => ((this/375.0)*Get.width);
}

extension ResponsiveText on double {
  double get sp => Get.width / 100.0 * (this/3);
}

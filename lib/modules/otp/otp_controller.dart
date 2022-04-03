import 'package:cash_book/data/services/api_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  final formKey = GlobalKey<FormState>();
  late TextEditingController otpController;
  final String loginPhone = Get.arguments['phone'];

  Future<void> verification() async {
    try {
      await ApiService().verification(loginPhone, otpController.text);
    } catch (e) {}
  }

  Future<void> resendOtp() async {
    try {} catch (e) {}
  }

  @override
  void onInit() {
    super.onInit();
    otpController = TextEditingController();
  }

}

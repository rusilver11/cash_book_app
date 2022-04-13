import 'package:cash_book/core/config/constants.dart';
import 'package:cash_book/core/library/exception.dart';
import 'package:cash_book/data/services/api_services.dart';
import 'package:cash_book/data/services/storage_services.dart';
import 'package:cash_book/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  final formKey = GlobalKey<FormState>();
  late TextEditingController otpController;
  final String loginPhone = Get.arguments['phone'];
  final StorageService storageService = StorageService();
  late String? storagePhone = ''; 
  final isSuccess = false.obs;

  Future<void> verification() async {
    try {
      if(otpController.text.length < 5) return EasyLoading.showError('Kode OTP Minimal 5 jika tidak sesuai tekan Kirim ulang kode OTP', duration:  Duration(seconds: 3));
      EasyLoading.show(status: kLoading);
      await ApiService().verification(loginPhone, otpController.text);
      Get.offNamed(AppRoute.getHomeRoute());
      otpController.clear();
      EasyLoading.dismiss();
      isSuccess.value = true;
    }on ValidationException catch (e) {
      isSuccess.value = false;
      return EasyLoading.showError(e.message,duration: Duration(seconds: 3));
    }
  }

  Future<void> resendOtp() async {
    try {
      EasyLoading.show(status: kLoading);
      await ApiService().resendOtp(loginPhone);
      EasyLoading.showSuccess('Kode OTP terkirim',duration: Duration(seconds: 3));
      isSuccess.value = true;
    }on ValidationException catch (e) {
      isSuccess.value = false;
      return EasyLoading.showError(e.message,duration: Duration(seconds: 3));
    }
  }

  @override
  void onInit() async{
    super.onInit();
    otpController = TextEditingController();
    storagePhone = await storageService.readSecureData('phone');
  }

}

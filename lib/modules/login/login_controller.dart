import 'package:cash_book/core/config/constants.dart';
import 'package:cash_book/core/library/exception.dart';
import 'package:cash_book/data/models/storage_items.dart';
import 'package:cash_book/data/services/api_services.dart';
import 'package:cash_book/data/services/storage_services.dart';
import 'package:cash_book/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {

late TextEditingController phoneController;
final formKey = GlobalKey<FormState>();
//RxString kPhoneController = ''.obs;
final StorageService storageService = StorageService();


Future<void> login() async{
  try {
    EasyLoading.show(status: kLoading);
    await ApiService().login(phoneController.text);
    Get.offNamed(AppRoute.getOtpRoute(),arguments: {'phone' : phoneController.text});
    //await storageService.writeSecureData(StorageItem('phone',phoneController.text));
    phoneController.clear();
    EasyLoading.dismiss();
  }on ValidationException catch(e){
    return EasyLoading.showError(e.message,duration: Duration(seconds: 3)); 
  }
}

//bring phone number to next
@override
  void onInit() {
    super.onInit();
    phoneController = TextEditingController();
    // phoneController.addListener(() {
    //   kPhoneController.value = phoneController.text;
    // });
  }


}
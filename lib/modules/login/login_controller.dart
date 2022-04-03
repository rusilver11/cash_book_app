import 'package:cash_book/core/library/exception.dart';
import 'package:cash_book/data/services/api_services.dart';
import 'package:cash_book/routes/route_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {

late TextEditingController phoneController;
final formKey = GlobalKey<FormState>();
//RxString kPhoneController = ''.obs;

Future<void> login() async{
  try {
    await ApiService().login(phoneController.text);
    Get.offNamed(RouteName.otp,arguments: {'phone' : phoneController.text});
    phoneController.clear();
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
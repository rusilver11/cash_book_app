import 'package:cash_book/data/services/storage_services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
    final StorageService storageService = StorageService();
    // late String? storageToken = '';
    // late String? storageRefreshToken = '';
    // late String? storageUserId = '';

  @override
  void onInit() async{
    super.onInit();
    // storageRefreshToken = await storageService.readSecureData('refreshToken');
    // storageToken = await storageService.readSecureData('token');
    // storageUserId = await storageService.readSecureData('userId');
  }
  

}
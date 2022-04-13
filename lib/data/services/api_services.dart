import 'package:cash_book/core/config/api_endpoints.dart';
import 'package:cash_book/core/config/constants.dart';
import 'package:cash_book/core/library/exception.dart';
import 'package:cash_book/data/models/storage_items.dart';
import 'package:cash_book/data/services/storage_services.dart';
import 'package:dio/dio.dart';

class ApiService {
  static final options = BaseOptions(
    baseUrl: ApiEndpoint.BASE_URL,
    connectTimeout: 60000, //60s
    receiveTimeout: 60000,
    sendTimeout: 60000,
    receiveDataWhenStatusError: true,
    followRedirects: false,
  );

  Dio dio = Dio(options);

  final StorageService localStorage = StorageService();

  Future<void> login(String phoneNumber) async {
    try {
      await dio.post(ApiEndpoint.POST_LOGIN, data: {'phone': phoneNumber});
    } on DioError catch (e) {
      switch (e.response!.statusCode) {
        case 404:
          throw ValidationException('Nomor anda tidak terdaftar di WhatsApp');
        case 400:
          throw ValidationException('Gagal mengirim OTP');
        default:
          throw ValidationException('Service sedang berhenti mohon tunggu');
      }
    }
  }

  Future<void> verification(String phoneNumber, String otp) async {
    try {
      final response = await dio.post(ApiEndpoint.POST_VERIFICATION,
          data: {'phone': phoneNumber, 'otp': otp});
      await localStorage.writeSecureData(StorageItem('userId', response.data['userId']));
      await localStorage.writeSecureData(StorageItem('token', response.data['token']));
      await localStorage.writeSecureData(StorageItem('refreshToken', response.data['refreshToken']));
    } on DioError catch (e) {
      switch (e.response!.statusCode) {
        case 400:
          throw ValidationException('OTP salah atau Kadaluarsa');
        default:
          throw ValidationException(kServiceStop);
      }
    }
  }

  Future<void> resendOtp(String phoneNumber) async {
    try {
      await dio.post(ApiEndpoint.POST_RESEND, data: {
        'phone': phoneNumber,
      });
    } on DioError catch (e) {
      switch (e.response!.statusCode) {
        case 404:
          throw ValidationException('Gagal mengirim nomor tidak ditemukan');
        case 400:
          throw ValidationException('Gagal mengirim kode OTP');
        default:
          throw ValidationException(kServiceStop);
      }
    }
  }
}

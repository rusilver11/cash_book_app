import 'package:cash_book/core/config/api_endpoints.dart';
import 'package:cash_book/core/library/exception.dart';
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

  Future<void> login(String phoneNumber) async {
    try {
      await dio.post(ApiEndpoint.POST_LOGIN, data: {'phone': phoneNumber});
    } on DioError catch (e) {
      switch (e.response!.statusCode) {
        case 404:
          throw ValidationException('Nomor anda tidak terdaftar di WhatsApp');
        case 400:
          throw ValidationException('Gagal mengirim OTP');
      }
    }
  }

  Future<void> verification(String phoneNumber, String otp) async {
    try {
      await dio.post(ApiEndpoint.POST_VERIFICATION,
          data: {'phone': phoneNumber, 'otp': otp});
    } on DioError catch (e) {
      var xy = e.response;
      throw ValidationException('OTP salah atau Kadaluarsa');
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
      }
    }
  }
  
}

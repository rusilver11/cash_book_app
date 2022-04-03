class ApiEndpoint{

  static const String BASE_URL = 'https://cash-book-service.herokuapp.com';

  static const String POST_LOGIN = BASE_URL+'/auth/login';
  static const String POST_VERIFICATION = BASE_URL+'/auth/login/otp';
  static const String POST_RESEND = BASE_URL+'/auth/login/resend-otp';
  static const String POST_REFRESH_TOKEN = BASE_URL+'/auth/token';

  // static String POST_REFRESH_TOKENII(String Id) => '/businesses/transactions/${Id}/detail';

}
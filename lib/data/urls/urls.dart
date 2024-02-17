class Urls{
  //static const String baseUrl = 'https://ecom-api.teamrabbil.com/api';
  static const String baseUrl = 'https://ecom-api.teamrabbil.com/api';
  static String verifyEmail(String email) => '$baseUrl/UserLogin/$email';
  static String verifyOtp(String email, String otp) => '$baseUrl/VerifyLogin/$email/$otp';
}
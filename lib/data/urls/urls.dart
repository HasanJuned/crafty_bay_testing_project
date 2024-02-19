class Urls{
  //static const String baseUrl = 'https://ecom-api.teamrabbil.com/api';
  static const String baseUrl = 'https://ecom-api.teamrabbil.com/api';
  static String verifyEmail(String email) => '$baseUrl/UserLogin/$email';
  static String verifyOtp(String email, String otp) => '$baseUrl/VerifyLogin/$email/$otp';
  static const String slider = '$baseUrl/ListProductSlider';
  static const String categoryList = '$baseUrl/CategoryList';
  static String productsByRemarks(productsByRemarks) => '$baseUrl/ListProductByRemark/$productsByRemarks';
  static String completeProfile = '$baseUrl/CreateProfile';
  static String readProfile = '$baseUrl/ReadProfile';
  static String productDetailsById(productId) => '$baseUrl/ProductDetailsById/$productId';
  static String createCartList = '$baseUrl/CreateCartList';
}
import 'package:crafty_bay_testing_project/presentation/state_holders/auth_controller.dart';
import 'package:crafty_bay_testing_project/presentation/state_holders/otp_verification_controller.dart';
import 'package:crafty_bay_testing_project/presentation/state_holders/popular_product_controller.dart';
import 'package:crafty_bay_testing_project/presentation/state_holders/read_profile_controller.dart';
import 'package:crafty_bay_testing_project/presentation/state_holders/slider_controller.dart';
import 'package:crafty_bay_testing_project/presentation/state_holders/special_product_controller.dart';
import 'package:get/get.dart';

import '../presentation/state_holders/category_controller.dart';
import '../presentation/state_holders/complete_profile_controller.dart';
import '../presentation/state_holders/email_verification_controller.dart';
import '../presentation/state_holders/main_bottom_nav_bar_controller.dart';
import '../presentation/state_holders/new_product_controller.dart';

class GetXBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(MainBottomNavBarController());
    Get.put(EmailVerificationController());
    Get.put(OtpVerificationController());
    Get.put(SliderController());
    Get.put(CategoryController());
    Get.put(NewProductController());
    Get.put(PopularProductController());
    Get.put(SpecialProductController());
    Get.put(CompleteProfileController());
    Get.put(ReadProfileController());
    Get.put(AuthController());
  }

}
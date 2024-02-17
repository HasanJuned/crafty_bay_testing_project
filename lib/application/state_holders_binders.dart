import 'package:crafty_bay_testing_project/presentation/state_holders/otp_verification_controller.dart';
import 'package:get/get.dart';

import '../presentation/state_holders/email_verification_controller.dart';
import '../presentation/state_holders/main_bottom_nav_bar_controller.dart';

class GetxBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(MainBottomNavBarController());
    Get.put(EmailVerificationController());
    Get.put(OtpVerificationController());
  }

}
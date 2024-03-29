import 'package:crafty_bay_testing_project/data/model/network_response.dart';
import 'package:crafty_bay_testing_project/data/services/network_caller.dart';
import 'package:crafty_bay_testing_project/presentation/state_holders/auth_controller.dart';
import 'package:get/get.dart';

import '../../data/urls/urls.dart';

class OtpVerificationController extends GetxController {
  bool _otpVerificationControllerInProgress = false;
  String _message = '';

  bool get otpVerificationControllerInProgress =>
      _otpVerificationControllerInProgress;

  String get message => _message;
  String _token = '';
  String get token => _token;
  Future<bool> verifyOtp(String email, String otp) async {
    _otpVerificationControllerInProgress = true;
    update();

    final NetworkResponse response =
        await NetworkCaller().getRequest(Urls.verifyOtp(email, otp));
    _otpVerificationControllerInProgress = false;

    if (response.isSuccess) {
      AuthController().setAccessToken(response.responseJson!['data']);
      _token = response.responseJson!['data'];
      update();
      return true;
    } else {
      _message = response.responseJson?['data'] ?? 'Something went error';
      update();
      return false;
    }
  }
}

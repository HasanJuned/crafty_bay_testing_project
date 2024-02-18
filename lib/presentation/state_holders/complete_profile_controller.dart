import 'package:crafty_bay_testing_project/data/model/network_response.dart';
import 'package:crafty_bay_testing_project/data/services/network_caller.dart';
import 'package:crafty_bay_testing_project/data/urls/urls.dart';
import 'package:crafty_bay_testing_project/presentation/state_holders/auth_controller.dart';
import 'package:crafty_bay_testing_project/presentation/state_holders/profile.dart';
import 'package:get/get.dart';

class CompleteProfileController extends GetxController {
  bool _completeProfileInProgress = false;
  String _message = '';
  Profile _profile = Profile();

  bool get completeProfileInProgress => _completeProfileInProgress;
  String get message => _message;
  Profile get profile => _profile;

  Future<bool> completeProfile(
      String token,
      String cusName,
      String cusAddress,
      String cusCity,
      String cusState,
      String cusPostcode,
      String cusCountry,
      String cusPhone,
      String cusFax) async {
    Map<String, dynamic> cusProfileDetails = {
      "cus_name": cusName,
      "cus_add": cusAddress,
      "cus_city": cusCity,
      "cus_state": cusState,
      "cus_postcode": cusPostcode,
      "cus_country": cusCountry,
      "cus_phone": cusPhone,
      "cus_fax": cusFax,
      "ship_name": cusName,
      "ship_add": cusAddress,
      "ship_city": cusCity,
      "ship_state": cusState,
      "ship_postcode": cusPostcode,
      "ship_country": cusCountry,
      "ship_phone": cusPhone,
    };

    _completeProfileInProgress = true;
    update();

    final NetworkResponse response = await NetworkCaller()
        .postRequest(Urls.completeProfile, cusProfileDetails, token: token);
    _completeProfileInProgress = false;

    if (response.isSuccess) {
      _profile = Profile.fromJson(response.responseJson?['data']);
      await Get.find<AuthController>().setAccessToken(token, profile: _profile);
      update();
      return true;
    } else {
      _message = 'Profile create failed';
      update();
      return false;
    }
  }
}

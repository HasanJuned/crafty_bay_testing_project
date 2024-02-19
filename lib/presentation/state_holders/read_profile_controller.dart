import 'package:crafty_bay_testing_project/data/model/network_response.dart';
import 'package:crafty_bay_testing_project/data/services/network_caller.dart';
import 'package:crafty_bay_testing_project/data/urls/urls.dart';
import 'package:crafty_bay_testing_project/data/model/profile.dart';
import 'package:get/get.dart';

class ReadProfileController extends GetxController {
  bool _readProfileControllerInProgress = false;
  String _message = '';
  Profile _profile = Profile();
  bool _isProfileCompleted = false;

  bool get readProfileControllerInProgress => _readProfileControllerInProgress;

  String get message => _message;

  Profile get profile => _profile;

  bool get isProfileCompleted => _isProfileCompleted;

  Future<bool> readProfile(String token) async {
    _readProfileControllerInProgress = true;
    update();

    final NetworkResponse response =
        await NetworkCaller().getRequest(Urls.baseUrl, token: token);
    _readProfileControllerInProgress = false;

    if (response.isSuccess) {
      final profileData = response.responseJson?['data'];
      if (profileData == null) {
        _isProfileCompleted = false;
      } else {
        _profile = Profile.fromJson(profileData);
        _isProfileCompleted = true;
      }
      update();
      return true;
    } else {
      _message = 'Read profile fetch failed';
      update();
      return false;
    }
  }
}

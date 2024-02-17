import 'package:crafty_bay_testing_project/data/model/network_response.dart';
import 'package:crafty_bay_testing_project/data/model/slider_model.dart';
import 'package:crafty_bay_testing_project/data/services/network_caller.dart';
import 'package:get/get.dart';

import '../../data/urls/urls.dart';

class SliderController extends GetxController {
  bool _sliderControllerInProgress = false;
  SliderModel _sliderModel = SliderModel();
  String _message = '';

  bool get sliderControllerInProgress => _sliderControllerInProgress;

  String get message => _message;

  SliderModel get sliderModel => _sliderModel;

  Future<bool> getSlider() async {
    _sliderControllerInProgress = true;
    update();

    final NetworkResponse response =
        await NetworkCaller().getRequest(Urls.slider);
    _sliderControllerInProgress = false;
    update();
    if (response.isSuccess) {
      _sliderModel = SliderModel.fromJson(response.responseJson ?? {});
      print(response.responseJson);
      return true;
    } else {
      return false;
    }
  }
}

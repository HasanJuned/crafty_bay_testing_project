import 'package:crafty_bay_testing_project/data/model/network_response.dart';
import 'package:crafty_bay_testing_project/data/model/products_by_remarks_model.dart';
import 'package:crafty_bay_testing_project/data/services/network_caller.dart';
import 'package:crafty_bay_testing_project/data/urls/urls.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  bool _popularProductsControllerInProgress = false;
  String _message = '';
  ProductsByRemarksModel _productsByRemarksModel = ProductsByRemarksModel();

  bool get popularProductsControllerInProgress => _popularProductsControllerInProgress;

  String get message => _message;

  ProductsByRemarksModel get productsByRemarksModel => _productsByRemarksModel;

  Future<bool> popularProducts() async {
    _popularProductsControllerInProgress = true;
    update();

    final NetworkResponse response =
    await NetworkCaller().getRequest(Urls.productsByRemarks('popular'));
    _popularProductsControllerInProgress = false;

    if (response.isSuccess) {
      _productsByRemarksModel =
          ProductsByRemarksModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    } else {
      _message = 'Popular Products fetching failed';
      update();
      return false;
    }
  }
}

import 'package:crafty_bay_testing_project/data/model/network_response.dart';
import 'package:crafty_bay_testing_project/data/model/products_by_remarks_model.dart';
import 'package:crafty_bay_testing_project/data/services/network_caller.dart';
import 'package:crafty_bay_testing_project/data/urls/urls.dart';
import 'package:get/get.dart';

class SpecialProductController extends GetxController {
  bool _specialProductsControllerInProgress = false;
  String _message = '';
  ProductsByRemarksModel _productsByRemarksModel = ProductsByRemarksModel();

  bool get specialProductsControllerInProgress => _specialProductsControllerInProgress;

  String get message => _message;

  ProductsByRemarksModel get productsByRemarksModel => _productsByRemarksModel;

  Future<bool> specialProducts() async {
    _specialProductsControllerInProgress = true;
    update();

    final NetworkResponse response =
    await NetworkCaller().getRequest(Urls.productsByRemarks('special'));
    _specialProductsControllerInProgress = false;

    if (response.isSuccess) {
      _productsByRemarksModel =
          ProductsByRemarksModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    } else {
      _message = 'Special Products fetching failed';
      update();
      return false;
    }
  }
}

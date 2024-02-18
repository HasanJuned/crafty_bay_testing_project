import 'package:crafty_bay_testing_project/data/model/network_response.dart';
import 'package:crafty_bay_testing_project/data/model/products_by_remarks_model.dart';
import 'package:crafty_bay_testing_project/data/services/network_caller.dart';
import 'package:crafty_bay_testing_project/data/urls/urls.dart';
import 'package:get/get.dart';

class NewProductController extends GetxController {
  bool _newProductsControllerInProgress = false;
  String _message = '';
  ProductsByRemarksModel _productsByRemarksModel = ProductsByRemarksModel();

  bool get newProductsControllerInProgress => _newProductsControllerInProgress;

  String get message => _message;

  ProductsByRemarksModel get productsByRemarksModel => _productsByRemarksModel;

  Future<bool> newProducts() async {
    _newProductsControllerInProgress = true;
    update();

    final NetworkResponse response =
        await NetworkCaller().getRequest(Urls.productsByRemarks('new'));
    _newProductsControllerInProgress = false;

    if (response.isSuccess) {
      _productsByRemarksModel =
          ProductsByRemarksModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    } else {
      _message = 'New Products fetching failed';
      update();
      return false;
    }
  }
}

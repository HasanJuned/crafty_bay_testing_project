import 'package:crafty_bay_testing_project/data/model/network_response.dart';
import 'package:crafty_bay_testing_project/data/model/product_details_data.dart';
import 'package:crafty_bay_testing_project/data/model/product_details_model.dart';
import 'package:crafty_bay_testing_project/data/services/network_caller.dart';
import 'package:crafty_bay_testing_project/data/urls/urls.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  bool _productDetailsControllerInProgress = false;
  ProductDetailsData _productDetailsData = ProductDetailsData();
  ProductDetailsModel _productDetailsModel = ProductDetailsModel();
  String _message = '';

  bool get productDetailsControllerInProgress =>
      _productDetailsControllerInProgress;

  ProductDetailsData get productDetailsData => _productDetailsData;

  String get message => _message;

  Future<bool> getProductDetails(int productId) async {
    _productDetailsControllerInProgress = true;
    update();

    final NetworkResponse response =
        await NetworkCaller().getRequest(Urls.productDetailsById(productId));
    _productDetailsControllerInProgress = false;

    if (response.isSuccess) {
      _productDetailsData =
          ProductDetailsModel.fromJson(response.responseJson ?? {}).data!.first;
      update();
      return true;
    } else {
      _message = 'Product details fetch failed';
      update();
      return false;
    }
  }
}

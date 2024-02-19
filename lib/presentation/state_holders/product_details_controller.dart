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
  final List<String> _availableColors = [];
  List<String> _availableSizes = [];

  bool get productDetailsControllerInProgress => _productDetailsControllerInProgress;
  ProductDetailsData get productDetailsData => _productDetailsData;
  String get message => _message;
  List<String> get availableColors => _availableColors;
  List<String> get availableSizes => _availableSizes;

  Future<bool> getProductDetails(int productId) async {
    _productDetailsControllerInProgress = true;
    update();

    final NetworkResponse response =
        await NetworkCaller().getRequest(Urls.productDetailsById(productId));
    _productDetailsControllerInProgress = false;

    if (response.isSuccess) {
      _productDetailsData = ProductDetailsModel.fromJson(response.responseJson ?? {}).data!.first;
      _convertStringToColor(_productDetailsData.color ?? '');
      _convertStringToSizes(_productDetailsData.size ?? '');
      update();
      return true;
    } else {
      _message = 'Product details fetch failed';
      update();
      return false;
    }
  }
  void _convertStringToColor(String color) {
    _availableColors.clear();
    final List<String> splittedColors = color.split(',');
    for (String c in splittedColors) {
      if (c.isNotEmpty) {
        _availableColors.add(c);
      }
    }
  }

  void _convertStringToSizes(String sizes) {
    _availableSizes = sizes.split(',');
  }
}

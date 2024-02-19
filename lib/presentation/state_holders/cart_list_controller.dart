import 'package:crafty_bay_testing_project/data/model/cart_list_model.dart';
import 'package:crafty_bay_testing_project/data/model/network_response.dart';
import 'package:crafty_bay_testing_project/data/services/network_caller.dart';
import 'package:crafty_bay_testing_project/data/urls/urls.dart';
import 'package:get/get.dart';

class AddToCartListController extends GetxController{

  bool _cartListControllerInProgress =  false;
  CartListModel _cartListModel = CartListModel();
  String _message = '';


  bool get cartListControllerInProgress => _cartListControllerInProgress;
  CartListModel get cartListModel => _cartListModel;
  String get message => _message;

  Future<bool> addToCartList(int productId, String color, String size, int quantity) async{
    _cartListControllerInProgress = true;
    update();

    Map<String,dynamic> productDetails = {
      "product_id": productId,
      "color": color,
      "size": size,
      "qty": quantity
    };

    final NetworkResponse response = await NetworkCaller().postRequest(Urls.createCartList, productDetails);
    _cartListControllerInProgress = false;
    if(response.isSuccess){
      _cartListModel = CartListModel.fromJson(response.responseJson?['data']);
      update();
      return true;
    }else{
      _message = 'Add to cart failed';
      update();
      return false;
    }
  }

}
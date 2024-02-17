import 'package:crafty_bay_testing_project/data/model/network_response.dart';
import 'package:crafty_bay_testing_project/data/services/network_caller.dart';
import 'package:get/get.dart';

import '../../data/model/category_model.dart';
import '../../data/urls/urls.dart';

class CategoryController extends GetxController{

  bool _categoryControllerInProgress = false;
  CategoryModel _categoryModel = CategoryModel();

  bool get categoryControllerInProgress => _categoryControllerInProgress;
  CategoryModel get categoryModel => _categoryModel;

  Future<bool> getCategoryData() async{
    _categoryControllerInProgress = true;
    update();

    final NetworkResponse response = await NetworkCaller().getRequest(Urls.categoryList);
    _categoryControllerInProgress = false;
    if(response.isSuccess){
      _categoryModel = CategoryModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    }else{
      print(response.responseJson);
      update();
      return false;
    }
  }





}
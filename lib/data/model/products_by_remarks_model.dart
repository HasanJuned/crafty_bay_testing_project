import 'package:crafty_bay_testing_project/data/model/category_data.dart';
import 'package:crafty_bay_testing_project/data/model/product_data.dart';

class ProductsByRemarksModel {
  String? msg;
  List<ProductData>? data;

  ProductsByRemarksModel({this.msg, this.data});

  ProductsByRemarksModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = <ProductData>[];
      json['data'].forEach((v) {
        data!.add(ProductData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


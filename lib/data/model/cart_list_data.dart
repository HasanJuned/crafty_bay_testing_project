class CartListData {
  String? userId;
  int? productId;
  String? color;
  String? size;
  int? qty;
  int? price;
  String? updatedAt;
  String? createdAt;
  int? id;

  CartListData(
      {this.userId,
        this.productId,
        this.color,
        this.size,
        this.qty,
        this.price,
        this.updatedAt,
        this.createdAt,
        this.id});

  CartListData.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    productId = json['product_id'];
    color = json['color'];
    size = json['size'];
    qty = json['qty'];
    price = json['price'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['product_id'] = productId;
    data['color'] = color;
    data['size'] = size;
    data['qty'] = qty;
    data['price'] = price;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}
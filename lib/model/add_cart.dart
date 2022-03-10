class CartModel {
  bool? status;
  String? message;
  HomeData? data;

  CartModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? HomeData.fromJson(json['data']) : null;
  }
}

class HomeData {
  int? id;
  dynamic quantity;
  List<Products> products = [];

  HomeData.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      json['products'].forEach((value) {
        products.add(Products.fromJson(value));
      });
    }
  }
}

class Products {
  dynamic price;
  dynamic oldPrice;
  String? image;
  String? name;
  String? description;
  dynamic discount;
  dynamic id;

  Products.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    price = json['price'];
    id = json['id'];
  }
}

class SearchModel {
  bool? status;
  String? message;
  HomeData? data;

  SearchModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? HomeData.fromJson(json['data']) : null;
  }
}

class HomeData {
  int? productPage;
  List<Products> data = [];
  HomeData.fromJson(Map<String, dynamic> json) {
    productPage = json['current_page'];
    if (json['data'] != null) {
      json['data'].forEach((element) {
        data.add(Products.fromJson(element));
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

class FavoriteGetModel {
  bool? status;
  String? message;
  Data? data;

  FavoriteGetModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = (json['data'] != null ? Data.fromJson(json['data']) : null)!;
  }
}

class Data {
  int? currentPage;
  List<DataItem> data = [];

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data.add(DataItem.fromJson(v));
      });
    }
  }
}

class DataItem {
  int? id;
  Product? product;

  DataItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product =
        (json['product'] != null ? Product.fromJson(json['product']) : null)!;
  }
}

class Product {
  int? id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  String? image;
  String? name;
  String? description;

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
  }
}

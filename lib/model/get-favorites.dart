class GetFavorite {
  bool? status;
  String? message;
  HomeData? data;

  GetFavorite.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? HomeData.fromJson(json['data']) : null;
  }
}

class HomeData {
  int? currentIndex;
  List<ProductList> data = [];

  HomeData.fromJson(Map<String, dynamic> json) {
    currentIndex = json['current_page'];
    if (json['data'] != null) {
      json['data'].forEach((value) {
        data.add(ProductList.fromJson(value));
      });
    }
  }
}

class ProductList {
  dynamic id;
  Products? products;

  ProductList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    products =
        json['product'] != null ? Products.fromJson(json['product']) : null;
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

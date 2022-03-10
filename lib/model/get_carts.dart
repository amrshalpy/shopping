import 'package:flutter/material.dart';

class GetCarts {
  bool? status;
  String? message;
  Data? data;

  GetCarts.formJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.formJson(json['data']) : null;
  }
}

class Data {
  List<CartItems> cartItems = [];
  dynamic total;
  dynamic subTotal;
  Data.formJson(Map<String, dynamic> json) {
    total = json['total'];
    subTotal = json['sub_total'];
    if (json['cart_items'] != null) {
      json['cart_items'].forEach((value) {
        cartItems.add(CartItems.formJson(value));
      });
    }
  }
}

class CartItems {
  int? id;
  int? quantity;
  Products? products;
  CartItems.formJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    products =
        json['product'] != null ? Products.formJson(json['product']) : null;
  }
}

class Products {
  dynamic id;
  dynamic price;
  dynamic discount;
  String? name;
  String? image;
  bool? inFavorite;
  bool? inCart;
  Products.formJson(Map<String, dynamic> json) {
    id = json['id'];
    discount = json['discount'];
    name = json['name'];
    price = json['price'];
    image = json['image'];
    inFavorite = json['in_favorites'];
    inCart = json['in_cart'];
  }
}

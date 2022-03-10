import 'package:flutter/material.dart';

class HomeModel {
  bool? status;
  String? message;
  HomeData? data;

  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? HomeData.fromJson(json['data']) : null;
  }
}

class HomeData {
  List<Banners> banners = [];
  List<Products> products = [];

  HomeData.fromJson(Map<String, dynamic> json) {
    if (json['banners'] != null) {
      json['banners'].forEach((value) {
        banners.add(Banners.fromJson(value));
      });
    }

    if (json['products'] != null) {
      json['products'].forEach((value) {
        products.add(Products.fromJson(value));
      });
    }
  }
}

class Banners {
  int? id;
  String? image;
  Banners.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
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
  bool? inFavorite;
  bool? inCart;

  Products.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    price = json['price'];
    inFavorite = json['in_favorites'];
    inCart = json['in_cart'];
    id = json['id'];
  }
}

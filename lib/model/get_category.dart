import 'package:flutter/material.dart';

class GetCategoryModel {
  bool? status;
  String? message;
  HomeData? data;

  GetCategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? HomeData.fromJson(json['data']) : null;
  }
}

class HomeData {
  List<DataList> dataList = [];

  HomeData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      json['data'].forEach((value) {
        dataList.add(DataList.fromJson(value));
      });
    }
  }
}

class DataList {
  int? id;
  String? image;
  String? name;
  DataList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
  }
}

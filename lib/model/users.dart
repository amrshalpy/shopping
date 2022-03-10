class UserModel {
  bool? status;
  String? message;
  Data? data;

  UserModel.fromjson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromjson(json['data']) : null;
  }
}

class Data {
  String? name;
  String? token;
  String? image;
  String? phone;
  String? email;
  int? id;

  Data.fromjson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    token = json['token'];
    image = json['image'];
    email = json['email'];
    id = json['id'];
  }
}

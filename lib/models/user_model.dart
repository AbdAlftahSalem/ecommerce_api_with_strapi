import 'order_model.dart';

class UserModel {
  int? id;
  String? username;
  String? email;
  String? provider;
  bool? confirmed;
  bool? blocked;
  Role? role;
  String? phone;
  String? profilePic;
  String? dateSignUp;
  String? createdAt;
  String? updatedAt;
  List<OrderModel>? orders;

  UserModel(
      {this.id,
      this.username,
      this.email,
      this.provider,
      this.confirmed,
      this.blocked,
      this.role,
      this.phone,
      this.profilePic,
      this.dateSignUp,
      this.createdAt,
      this.updatedAt,
      this.orders});

  UserModel.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.username = json["username"];
    this.email = json["email"];
    this.provider = json["provider"];
    this.confirmed = json["confirmed"];
    this.blocked = json["blocked"];
    this.role = json["role"] == null ? null : Role.fromJson(json["role"]);
    this.phone = json["phone"];
    this.profilePic = json["profilePic"];
    this.dateSignUp = json["dateSignUp"];
    this.createdAt = json["created_at"];
    this.updatedAt = json["updated_at"];
    this.orders = json["orders"] == null
        ? null
        : (json["orders"] as List).map((e) => OrderModel.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["username"] = this.username;
    data["email"] = this.email;
    data["provider"] = this.provider;
    data["confirmed"] = this.confirmed;
    data["blocked"] = this.blocked;
    if (this.role != null) data["role"] = this.role?.toJson();
    data["phone"] = this.phone;
    data["profilePic"] = this.profilePic;
    data["dateSignUp"] = this.dateSignUp;
    data["created_at"] = this.createdAt;
    data["updated_at"] = this.updatedAt;
    if (this.orders!.isNotEmpty)
      data["orders"] = this.orders?.map((e) => e.toJson()).toList();
    return data;
  }
}

class Role {
  int? id;
  String? name;
  String? description;
  String? type;

  Role({this.id, this.name, this.description, this.type});

  Role.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.name = json["name"];
    this.description = json["description"];
    this.type = json["type"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["name"] = this.name;
    data["description"] = this.description;
    data["type"] = this.type;
    return data;
  }
}

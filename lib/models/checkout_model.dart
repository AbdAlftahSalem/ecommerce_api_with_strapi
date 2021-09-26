import 'package:ecommerce_api/models/order_model.dart';

class CheckoutModel {
  int? id;
  String? customerName;
  String? customerId;
  String? customerEmail;
  String? customerPhone;
  String? customerPic;
  String? customerStreet;
  String? customerCity;
  String? countity;
  String? dateOfOrder;
  String? price;
  String? publishedAt;
  String? createdAt;
  String? updatedAt;
  List<OrderModel>? orders;

  CheckoutModel(
      {this.id,
      this.customerName,
      this.customerId,
      this.customerEmail,
      this.customerPhone,
      this.customerPic,
      this.customerStreet,
      this.customerCity,
      this.countity,
      this.dateOfOrder,
      this.price,
      this.publishedAt,
      this.createdAt,
      this.updatedAt,
      this.orders});

  CheckoutModel.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.customerName = json["customerName"];
    this.customerId = json["customerId"];
    this.customerEmail = json["customerEmail"];
    this.customerPhone = json["customerPhone"];
    this.customerPic = json["customerPic"];
    this.customerStreet = json["customerStreet"];
    this.customerCity = json["customerCity"];
    this.countity = json["countity"];
    this.dateOfOrder = json["dateOfOrder"];
    this.price = json["price"];
    this.publishedAt = json["published_at"];
    this.createdAt = json["created_at"];
    this.updatedAt = json["updated_at"];
    this.orders = json["orders"] == null
        ? null
        : (json["orders"] as List).map((e) => OrderModel.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["customerName"] = this.customerName;
    data["customerId"] = this.customerId;
    data["customerEmail"] = this.customerEmail;
    data["customerPhone"] = this.customerPhone;
    data["customerPic"] = this.customerPic;
    data["customerStreet"] = this.customerStreet;
    data["customerCity"] = this.customerCity;
    data["countity"] = this.countity;
    data["dateOfOrder"] = this.dateOfOrder;
    data["price"] = this.price;
    data["published_at"] = this.publishedAt;
    data["created_at"] = this.createdAt;
    data["updated_at"] = this.updatedAt;
    if (this.orders != null)
      data["orders"] = this.orders?.map((e) => e.toJson()).toList();
    return data;
  }
}
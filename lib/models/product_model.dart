import 'category_model.dart';

class ProductsModel {
  int? id;
  String? title,
      desc,
      size,
      image,
      color,
      createdAt,
      updatedAt,
      publishedAt,
      price;
  CategoryModel? category;

  ProductsModel({
    this.id,
    this.title,
    this.desc,
    this.size,
    this.image,
    this.color,
    this.category,
    this.publishedAt,
    this.createdAt,
    this.updatedAt,
    this.price,
  });

  ProductsModel.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.title = json["title"];
    this.desc = json["desc"];
    this.size = json["size"];
    this.image = json["image"];
    this.color = json["color"];
    this.category = json["category"] == null
        ? null
        : CategoryModel.fromJson(json["category"]);
    this.publishedAt = json["published_at"];
    this.createdAt = json["created_at"];
    this.updatedAt = json["updated_at"];
    this.price = json["price"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["title"] = this.title;
    data["desc"] = this.desc;
    data["size"] = this.size;
    data["image"] = this.image;
    data["color"] = this.color;
    if (this.category != null) data["category"] = this.category?.toJson();
    data["published_at"] = this.publishedAt;
    data["created_at"] = this.createdAt;
    data["updated_at"] = this.updatedAt;
    data["price"] = this.price;
    return data;
  }
}

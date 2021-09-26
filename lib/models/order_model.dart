class OrderModel {
  int? id;
  String? idProduct;
  String? titleProduct;
  String? descProduct;
  String? sizeProduct;
  String? colorProduct;
  // quantity
  String? countityProduct;
  String? priceProduct;
  String? dateProduct;
  String? imageProduct;
  String? publishedAt;
  String? createdAt;
  String? updatedAt;

  OrderModel(
      {this.id,
      this.idProduct,
      this.titleProduct,
      this.descProduct,
      this.sizeProduct,
      this.colorProduct,
      this.countityProduct,
      this.priceProduct,
      this.dateProduct,
      this.imageProduct,
      this.publishedAt,
      this.createdAt,
      this.updatedAt});

  OrderModel.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.idProduct = json["IdProduct"];
    this.titleProduct = json["titleProduct"];
    this.descProduct = json["descProduct"];
    this.sizeProduct = json["sizeProduct"];
    this.colorProduct = json["colorProduct"];
    this.countityProduct = json["countityProduct"];
    this.priceProduct = json["priceProduct"];
    this.dateProduct = json["dateProduct"];
    this.imageProduct = json["imageProduct"];
    this.publishedAt = json["published_at"];
    this.createdAt = json["created_at"];
    this.updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["IdProduct"] = this.idProduct;
    data["titleProduct"] = this.titleProduct;
    data["descProduct"] = this.descProduct;
    data["sizeProduct"] = this.sizeProduct;
    data["colorProduct"] = this.colorProduct;
    data["countityProduct"] = this.countityProduct;
    data["priceProduct"] = this.priceProduct;
    data["dateProduct"] = this.dateProduct;
    data["imageProduct"] = this.imageProduct;
    data["published_at"] = this.publishedAt;
    data["created_at"] = this.createdAt;
    data["updated_at"] = this.updatedAt;
    return data;
  }
}

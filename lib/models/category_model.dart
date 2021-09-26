class CategoryModel {
  int? id;
  String? title;
  String? publishedAt;
  String? createdAt;
  String? updatedAt;
  CategoryImagemodel? image;

  CategoryModel(
      {this.id = 0,
      this.title = "",
      this.publishedAt = "",
      this.createdAt = "",
      this.updatedAt = "",
      this.image});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.title = json["title"];
    this.publishedAt = json["published_at"];
    this.createdAt = json["created_at"];
    this.updatedAt = json["updated_at"];
    this.image = json["image"] == null ? null : CategoryImagemodel.fromJson(json["image"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["title"] = this.title;
    data["published_at"] = this.publishedAt;
    data["created_at"] = this.createdAt;
    data["updated_at"] = this.updatedAt;
    if (this.image != null) data["image"] = this.image?.toJson();
    return data;
  }
}

class CategoryImagemodel {
  int? id;
  String? name;
  String? alternativeText;
  String? caption;
  int? width;
  int? height;
  Formats? formats;
  String? hash;
  String? ext;
  String? mime;
  double? size;
  String? url;
  dynamic? previewUrl;
  String? provider;
  dynamic? providerMetadata;
  String? createdAt;
  String? updatedAt;

  CategoryImagemodel({
    this.id = 0,
    this.name = "",
    this.alternativeText = "",
    this.caption = "",
    this.width = 0,
    this.height = 0,
    this.formats,
    this.hash = "",
    this.ext = "",
    this.mime = "",
    this.size = 0,
    this.url = "",
    this.previewUrl = "",
    this.provider = "",
    this.providerMetadata = "",
    this.createdAt = "",
    this.updatedAt = "",
  });

  CategoryImagemodel.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.name = json["name"];
    this.alternativeText = json["alternativeText"];
    this.caption = json["caption"];
    this.width = json["width"];
    this.height = json["height"];
    this.formats =
        json["formats"] == null ? null : Formats.fromJson(json["formats"]);
    this.hash = json["hash"];
    this.ext = json["ext"];
    this.mime = json["mime"];
    this.size = json["size"];
    this.url = json["url"];
    this.previewUrl = json["previewUrl"];
    this.provider = json["provider"];
    this.providerMetadata = json["provider_metadata"];
    this.createdAt = json["created_at"];
    this.updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["name"] = this.name;
    data["alternativeText"] = this.alternativeText;
    data["caption"] = this.caption;
    data["width"] = this.width;
    data["height"] = this.height;
    if (this.formats != null) data["formats"] = this.formats?.toJson();
    data["hash"] = this.hash;
    data["ext"] = this.ext;
    data["mime"] = this.mime;
    data["size"] = this.size;
    data["url"] = this.url;
    data["previewUrl"] = this.previewUrl;
    data["provider"] = this.provider;
    data["provider_metadata"] = this.providerMetadata;
    data["created_at"] = this.createdAt;
    data["updated_at"] = this.updatedAt;
    return data;
  }
}

class Formats {
  Thumbnail? thumbnail;
  Large? large;
  Medium? medium;
  Small? small;

  Formats({
    this.thumbnail,
    this.large,
    this.medium,
    this.small,
  });

  Formats.fromJson(Map<String, dynamic> json) {
    this.thumbnail = json["thumbnail"] == null
        ? null
        : Thumbnail.fromJson(json["thumbnail"]);
    this.large = json["large"] == null ? null : Large.fromJson(json["large"]);
    this.medium =
        json["medium"] == null ? null : Medium.fromJson(json["medium"]);
    this.small = json["small"] == null ? null : Small.fromJson(json["small"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.thumbnail != null) data["thumbnail"] = this.thumbnail?.toJson();
    if (this.large != null) data["large"] = this.large?.toJson();
    if (this.medium != null) data["medium"] = this.medium?.toJson();
    if (this.small != null) data["small"] = this.small?.toJson();
    return data;
  }
}

class Small {
  String? name;
  String? hash;
  String? ext;
  String? mime;
  int? width;
  int? height;
  double? size;
  dynamic? path;
  String? url;

  Small({
    this.name = "",
    this.hash = "",
    this.ext = "",
    this.mime = "",
    this.width = 0,
    this.height = 0,
    this.size = 0,
    this.path = "",
    this.url = "",
  });

  Small.fromJson(Map<String, dynamic> json) {
    this.name = json["name"];
    this.hash = json["hash"];
    this.ext = json["ext"];
    this.mime = json["mime"];
    this.width = json["width"];
    this.height = json["height"];
    this.size = json["size"];
    this.path = json["path"];
    this.url = json["url"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["name"] = this.name;
    data["hash"] = this.hash;
    data["ext"] = this.ext;
    data["mime"] = this.mime;
    data["width"] = this.width;
    data["height"] = this.height;
    data["size"] = this.size;
    data["path"] = this.path;
    data["url"] = this.url;
    return data;
  }
}

class Medium {
  String? name;
  String? hash;
  String? ext;
  String? mime;
  int? width;
  int? height;
  double? size;
  dynamic? path;
  String? url;

  Medium({
    this.name = "",
    this.hash = "",
    this.ext = "",
    this.mime = "",
    this.width = 0,
    this.height = 0,
    this.size = 0,
    this.path = "",
    this.url = "",
  });

  Medium.fromJson(Map<String, dynamic> json) {
    this.name = json["name"];
    this.hash = json["hash"];
    this.ext = json["ext"];
    this.mime = json["mime"];
    this.width = json["width"];
    this.height = json["height"];
    this.size = json["size"];
    this.path = json["path"];
    this.url = json["url"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["name"] = this.name;
    data["hash"] = this.hash;
    data["ext"] = this.ext;
    data["mime"] = this.mime;
    data["width"] = this.width;
    data["height"] = this.height;
    data["size"] = this.size;
    data["path"] = this.path;
    data["url"] = this.url;
    return data;
  }
}

class Large {
  String? name;
  String? hash;
  String? ext;
  String? mime;
  int? width;
  int? height;
  double? size;
  dynamic? path;
  String? url;

  Large({
    this.name = "",
    this.hash = "",
    this.ext = "",
    this.mime = "",
    this.width = 0,
    this.height = 0,
    this.size = 0,
    this.path = "",
    this.url = "",
  });

  Large.fromJson(Map<String, dynamic> json) {
    this.name = json["name"];
    this.hash = json["hash"];
    this.ext = json["ext"];
    this.mime = json["mime"];
    this.width = json["width"];
    this.height = json["height"];
    this.size = json["size"];
    this.path = json["path"];
    this.url = json["url"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["name"] = this.name;
    data["hash"] = this.hash;
    data["ext"] = this.ext;
    data["mime"] = this.mime;
    data["width"] = this.width;
    data["height"] = this.height;
    data["size"] = this.size;
    data["path"] = this.path;
    data["url"] = this.url;
    return data;
  }
}

class Thumbnail {
  String? name;
  String? hash;
  String? ext;
  String? mime;
  int? width;
  int? height;
  double? size;
  dynamic? path;
  String? url;

  Thumbnail({
    this.name= "",
    this.hash= "",
    this.ext= "",
    this.mime= "",
    this.width= 0,
    this.height= 0,
    this.size= 0,
    this.path= "",
    this.url= "",
  });

  Thumbnail.fromJson(Map<String, dynamic> json) {
    this.name = json["name"];
    this.hash = json["hash"];
    this.ext = json["ext"];
    this.mime = json["mime"];
    this.width = json["width"];
    this.height = json["height"];
    this.size = json["size"];
    this.path = json["path"];
    this.url = json["url"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["name"] = this.name;
    data["hash"] = this.hash;
    data["ext"] = this.ext;
    data["mime"] = this.mime;
    data["width"] = this.width;
    data["height"] = this.height;
    data["size"] = this.size;
    data["path"] = this.path;
    data["url"] = this.url;
    return data;
  }
}

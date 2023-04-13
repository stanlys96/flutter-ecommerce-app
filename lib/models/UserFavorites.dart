class UserFavoritesModel {
  String? message;
  List<UserFavorite>? data;

  UserFavoritesModel({this.message, this.data});

  UserFavoritesModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <UserFavorite>[];
      json['data'].forEach((v) {
        data!.add(new UserFavorite.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserFavorite {
  int? id;
  String? name;
  String? category;
  String? subtitle;
  String? price;
  String? discount;
  String? size;
  String? color;
  String? description;
  int? rating;
  int? reviews;
  int? stock;
  String? imageUrl;
  List<String>? imageDetailUrl;
  String? productType;
  int? productId;
  int? userId;

  UserFavorite(
      {this.id,
      this.name,
      this.category,
      this.subtitle,
      this.price,
      this.discount,
      this.size,
      this.color,
      this.description,
      this.rating,
      this.reviews,
      this.stock,
      this.imageUrl,
      this.imageDetailUrl,
      this.productType,
      this.productId,
      this.userId});

  UserFavorite.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    category = json['category'];
    subtitle = json['subtitle'];
    price = json['price'];
    discount = json['discount'];
    size = json['size'];
    color = json['color'];
    description = json['description'];
    rating = json['rating'];
    reviews = json['reviews'];
    stock = json['stock'];
    imageUrl = json['image_url'];
    imageDetailUrl = json['image_detail_url'].cast<String>();
    productType = json['product_type'];
    productId = json['product_id'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['category'] = this.category;
    data['subtitle'] = this.subtitle;
    data['price'] = this.price;
    data['discount'] = this.discount;
    data['size'] = this.size;
    data['color'] = this.color;
    data['description'] = this.description;
    data['rating'] = this.rating;
    data['reviews'] = this.reviews;
    data['stock'] = this.stock;
    data['image_url'] = this.imageUrl;
    data['image_detail_url'] = this.imageDetailUrl;
    data['product_type'] = this.productType;
    data['product_id'] = this.productId;
    data['user_id'] = this.userId;
    return data;
  }
}

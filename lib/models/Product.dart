class ProductResponseModel {
  String? message;
  List<Product>? data;

  ProductResponseModel({this.message, this.data});

  ProductResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <Product>[];
      json['data'].forEach((v) {
        data!.add(new Product.fromJson(v));
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

class Product {
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

  Product(
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
      this.imageDetailUrl});

  Product.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}

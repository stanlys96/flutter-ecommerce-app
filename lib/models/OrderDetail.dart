class OrderDetailResponseModel {
  String? msg;
  List<OrderDetail>? data;

  OrderDetailResponseModel({this.msg, this.data});

  OrderDetailResponseModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = <OrderDetail>[];
      json['data'].forEach((v) {
        data!.add(new OrderDetail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderDetail {
  int? id;
  String? orderNumber;
  String? trackingNumber;
  String? status;
  String? orderDate;
  String? shippingAddress;
  String? paymentMethod;
  String? cardNumber;
  String? deliveryMethod;
  int? deliveryFee;
  int? discount;
  int? totalAmount;
  List<ProductDetail>? products;
  int? userId;

  OrderDetail(
      {this.id,
      this.orderNumber,
      this.trackingNumber,
      this.status,
      this.orderDate,
      this.shippingAddress,
      this.paymentMethod,
      this.cardNumber,
      this.deliveryMethod,
      this.deliveryFee,
      this.discount,
      this.totalAmount,
      this.products,
      this.userId});

  OrderDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderNumber = json['order_number'];
    trackingNumber = json['tracking_number'];
    status = json['status'];
    orderDate = json['order_date'];
    shippingAddress = json['shipping_address'];
    paymentMethod = json['payment_method'];
    cardNumber = json['card_number'];
    deliveryMethod = json['delivery_method'];
    deliveryFee = json['delivery_fee'];
    discount = json['discount'];
    totalAmount = json['total_amount'];
    if (json['products'] != null) {
      products = <ProductDetail>[];
      json['products'].forEach((v) {
        products!.add(new ProductDetail.fromJson(v));
      });
    }
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_number'] = this.orderNumber;
    data['tracking_number'] = this.trackingNumber;
    data['status'] = this.status;
    data['order_date'] = this.orderDate;
    data['shipping_address'] = this.shippingAddress;
    data['payment_method'] = this.paymentMethod;
    data['card_number'] = this.cardNumber;
    data['delivery_method'] = this.deliveryMethod;
    data['delivery_fee'] = this.deliveryFee;
    data['discount'] = this.discount;
    data['total_amount'] = this.totalAmount;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['user_id'] = this.userId;
    return data;
  }
}

class ProductDetail {
  int? id;
  String? name;
  String? size;
  String? color;
  String? price;
  int? stock;
  int? amount;
  int? rating;
  int? reviews;
  int? userId;
  String? category;
  String? discount;
  String? subtitle;
  String? imageUrl;
  int? productId;
  String? description;
  String? productType;
  List<String>? imageDetailUrl;

  ProductDetail(
      {this.id,
      this.name,
      this.size,
      this.color,
      this.price,
      this.stock,
      this.amount,
      this.rating,
      this.reviews,
      this.userId,
      this.category,
      this.discount,
      this.subtitle,
      this.imageUrl,
      this.productId,
      this.description,
      this.productType,
      this.imageDetailUrl});

  ProductDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    size = json['size'];
    color = json['color'];
    price = json['price'];
    stock = json['stock'];
    amount = json['amount'];
    rating = json['rating'];
    reviews = json['reviews'];
    userId = json['user_id'];
    category = json['category'];
    discount = json['discount'];
    subtitle = json['subtitle'];
    imageUrl = json['image_url'];
    productId = json['product_id'];
    description = json['description'];
    productType = json['product_type'];
    imageDetailUrl = json['image_detail_url'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['size'] = this.size;
    data['color'] = this.color;
    data['price'] = this.price;
    data['stock'] = this.stock;
    data['amount'] = this.amount;
    data['rating'] = this.rating;
    data['reviews'] = this.reviews;
    data['user_id'] = this.userId;
    data['category'] = this.category;
    data['discount'] = this.discount;
    data['subtitle'] = this.subtitle;
    data['image_url'] = this.imageUrl;
    data['product_id'] = this.productId;
    data['description'] = this.description;
    data['product_type'] = this.productType;
    data['image_detail_url'] = this.imageDetailUrl;
    return data;
  }
}

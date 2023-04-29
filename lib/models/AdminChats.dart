class AdminChatsResponseModel {
  String? msg;
  List<AdminChat>? data;

  AdminChatsResponseModel({this.msg, this.data});

  AdminChatsResponseModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = <AdminChat>[];
      json['data'].forEach((v) {
        data!.add(new AdminChat.fromJson(v));
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

class AdminChat {
  int? id;
  int? userId;
  String? message;
  int? toUser;
  String? messageSent;
  String? name;
  String? email;
  String? password;
  String? createdOn;
  String? lastLogin;
  bool? admin;

  AdminChat(
      {this.id,
      this.userId,
      this.message,
      this.toUser,
      this.messageSent,
      this.name,
      this.email,
      this.password,
      this.createdOn,
      this.lastLogin,
      this.admin});

  AdminChat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    message = json['message'];
    toUser = json['to_user'];
    messageSent = json['message_sent'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    createdOn = json['created_on'];
    lastLogin = json['last_login'];
    admin = json['admin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['message'] = this.message;
    data['to_user'] = this.toUser;
    data['message_sent'] = this.messageSent;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['created_on'] = this.createdOn;
    data['last_login'] = this.lastLogin;
    data['admin'] = this.admin;
    return data;
  }
}

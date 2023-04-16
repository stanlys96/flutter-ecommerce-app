class LoginModel {
  String? msg;
  String? email;
  String? token;
  int? userId;
  String? name;

  LoginModel({this.msg, this.email, this.token, this.userId, this.name});

  LoginModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    email = json['email'];
    token = json['token'];
    userId = json['user_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    data['email'] = this.email;
    data['token'] = this.token;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    return data;
  }
}

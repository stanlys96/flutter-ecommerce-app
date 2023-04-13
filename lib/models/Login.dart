class LoginModel {
  String? msg;
  String? email;
  String? token;
  int? userId;

  LoginModel({this.msg, this.email, this.token, this.userId});

  LoginModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    email = json['email'];
    token = json['token'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    data['email'] = this.email;
    data['token'] = this.token;
    data['user_id'] = this.userId;
    return data;
  }
}

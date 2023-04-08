class LoginModel {
  String? msg;
  String? email;
  String? token;

  LoginModel({this.msg, this.email, this.token});

  LoginModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    email = json['email'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    data['email'] = this.email;
    data['token'] = this.token;
    return data;
  }
}

class AddOrderResponse {
  String? msg;

  AddOrderResponse({this.msg});

  AddOrderResponse.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    return data;
  }
}

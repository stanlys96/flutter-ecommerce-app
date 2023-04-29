class ChatResponseModel {
  String? msg;
  List<Chat>? data;

  ChatResponseModel({this.msg, this.data});

  ChatResponseModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = <Chat>[];
      json['data'].forEach((v) {
        data!.add(new Chat.fromJson(v));
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

class Chat {
  int? id;
  int? userId;
  String? message;
  int? toUser;
  String? messageSent;

  Chat({this.id, this.userId, this.message, this.toUser, this.messageSent});

  Chat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    message = json['message'];
    toUser = json['to_user'];
    messageSent = json['message_sent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['message'] = this.message;
    data['to_user'] = this.toUser;
    data['message_sent'] = this.messageSent;
    return data;
  }
}

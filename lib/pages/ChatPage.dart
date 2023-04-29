import 'package:ecommerce_app/controller/chat_controller.dart';
import 'package:ecommerce_app/models/Chat.dart';
import 'package:ecommerce_app/models/ChatScreenArguments.dart';
import 'package:ecommerce_app/models/Message.dart';
import 'package:ecommerce_app/provider/HomeProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatPage extends StatefulWidget {
  static String routeName = '/chat';

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final ScrollController _controller = ScrollController();

  void _scrollDownSmooth() {
    _controller.jumpTo(
      _controller.position.maxScrollExtent,
    );
  }

  void _scrollDown() {
    _controller.jumpTo(
      _controller.position.maxScrollExtent + 37,
    );
  }

  TextEditingController messageController = TextEditingController();
  late IO.Socket socket;
  ChatController chatController = ChatController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    socket = IO.io(
      'http://localhost:3001',
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .disableAutoConnect()
          .build(),
    );
    socket.connect();
    setUpSocketListener();
    HomeProvider homeProvider =
        Provider.of<HomeProvider>(context, listen: false);
    homeProvider.refetchUserChat(homeProvider.userId);
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollDownSmooth());
  }

  void sendMessage(String value, HomeProvider homeProvider, int toUser) async {
    var messageJson = {
      "message": value,
      "sentByMe": homeProvider.userId,
      "sendTo": toUser
    };
    socket.emit('message', messageJson);
  }

  void setUpSocketListener() {
    socket.on('message-receive', (data) async {
      HomeProvider homeProvider =
          Provider.of<HomeProvider>(context, listen: false);
      await homeProvider.refetchUserChat(homeProvider.userId);
      if (_controller.position.maxScrollExtent > 0) {
        _scrollDown();
      } else {
        _scrollDownSmooth();
      }
    });
    socket.on('chat-added', (data) async {
      HomeProvider homeProvider =
          Provider.of<HomeProvider>(context, listen: false);
      await homeProvider.refetchUserChat(homeProvider.userId);
      if (_controller.position.maxScrollExtent > 0) {
        _scrollDown();
      } else {
        _scrollDownSmooth();
      }
    });
    // socket.on('connected-user', (data) {
    //   chatController.connectedUser.value = data;
    // });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    socket.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ChatScreenArguments chatScreenArguments =
        (ModalRoute.of(context)!.settings.arguments) as ChatScreenArguments;

    return Consumer<HomeProvider>(
        builder: (secondContext, homeProvider, child) {
      List<Chat>? filteredChat = homeProvider.currentUserChat;
      if (homeProvider.admin) {
        filteredChat = homeProvider.currentUserChat
            ?.where((userChat) =>
                userChat.toUser == chatScreenArguments.toUser ||
                userChat.userId == chatScreenArguments.toUser)
            .toList();
      }

      return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          title: Text(chatScreenArguments.name),
          backgroundColor: Colors.blueGrey,
          // elevation: 0,
        ),
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Container(
              padding: EdgeInsets.only(
                top: 15.0,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  opacity: 0.4,
                  fit: BoxFit.cover,
                  image: AssetImage('images/fasion.png'),
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 9,
                    child: Container(
                      // margin: EdgeInsets.only(bottom: 30.0),
                      child: ListView.builder(
                        // reverse: true,
                        controller: _controller,
                        itemCount: filteredChat?.length ?? 0,
                        itemBuilder: (context, index) {
                          var currentItem = filteredChat?[index];
                          return MessageItem(
                            sentByMe:
                                currentItem?.userId == homeProvider.userId,
                            message: currentItem?.message ?? "",
                          );
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        cursorColor: Colors.purple,
                        controller: messageController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          suffixIcon: Container(
                            margin: EdgeInsets.only(
                              right: 5,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.purple,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: IconButton(
                              onPressed: () {
                                sendMessage(messageController.text,
                                    homeProvider, chatScreenArguments.toUser);
                                messageController.clear();
                              },
                              icon: Icon(
                                Icons.send,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ),
      );
    });
  }
}

class MessageItem extends StatelessWidget {
  final bool sentByMe;
  final String message;

  MessageItem({required this.sentByMe, required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: sentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 10,
        ),
        margin: EdgeInsets.symmetric(
          vertical: 3,
          horizontal: 10,
        ),
        decoration: BoxDecoration(
          color: sentByMe ? Colors.purple : Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Expanded(
              flex: message.length > 40 ? 1 : 0,
              child: Text(
                message,
                style: TextStyle(
                  color: sentByMe ? Colors.white : Colors.purple,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "1:10 AM",
              style: TextStyle(
                color:
                    (sentByMe ? Colors.white : Colors.purple).withOpacity(0.7),
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

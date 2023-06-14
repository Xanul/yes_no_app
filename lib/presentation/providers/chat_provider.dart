import 'package:flutter/material.dart';
import '../../domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {

  final ScrollController chatScrollController = ScrollController();

  

  List<Message> messageList = [
    Message(text: "Hola anonimo!", fromWho: FromWho.mine),
    Message(text: "Que estas haciendo", fromWho: FromWho.mine)
  ];

  Future<void> sendMessage(String text) async {
    final newMessage = Message(text: text, fromWho: FromWho.mine);
    messageList.add(newMessage);

    notifyListeners();
    moveScrollToBottom();
  }

  void moveScrollToBottom() {

    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent + 50, 
      duration: const Duration(milliseconds: 300), 
      curve: Curves.easeOut
    );
  }

}
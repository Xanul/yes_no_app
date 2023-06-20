import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import '../../domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {

  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnsewer = GetYesNoAnswer();
  

  List<Message> messageList = [
    Message(text: "Hola anonimo!", fromWho: FromWho.mine),
    Message(text: "Que estas haciendo", fromWho: FromWho.mine)
  ];

  Future<void> otherReply() async {
    final otherMessage = await getYesNoAnsewer.getAnswer();
  }

  Future<void> sendMessage(String text) async {

    if (text.isEmpty) return;

    final newMessage = Message(text: text, fromWho: FromWho.mine);
    messageList.add(newMessage);
    
    if (text.endsWith('? ')){
      otherReply();
    }    

    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {

    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent + 50, 
      duration: const Duration(milliseconds: 300), 
      curve: Curves.easeOut
    );
  }

}
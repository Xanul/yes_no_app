import 'package:flutter/material.dart';
import '../../domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {

  List<Message> messages = [
    Message(text: "Hola anonimo!", fromWho: FromWho.mine),
    Message(text: "Que estas haciendo", fromWho: FromWho.mine)
  ];

  Future<void> SendMessage(String text) async {
    // TODO: implementar metodo
  }

  

}
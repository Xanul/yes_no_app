import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/others_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(7.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              "https://media.licdn.com/dms/image/C4E03AQEjq8C6WKLZ0Q/profile-displayphoto-shrink_800_800/0/1640630499409?e=2147483647&v=beta&t=UrE57lIunz37Rla64yoaBoT_8fAukD3eMTWM8c7pQO0"
            ),
          ),
        ),
        title: const Text("Chat de usuario 💻"),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    final chatProvider = context.watch<ChatProvider>();
   
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messageList[index];
                  return (message.fromWho == FromWho.others)
                    ? const OthersMessageBubble()
                    : MyMessageBubble(textMsg: message  ,);
              })),
            MessageFieldBox(
              onValue: (value) => chatProvider.sendMessage(value),
            )
          ],
        ),
      ),
    );
  }
}


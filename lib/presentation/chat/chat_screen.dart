import 'package:flutter/material.dart';

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
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                return Text("Indice: $index");
              },) 
            ),
            const Text("Hola"),
          ],
        ),
      ),
    );
  }
}
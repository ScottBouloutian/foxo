import 'package:flutter/material.dart';
import 'dart:math';

class Message extends StatefulWidget {
  Message({Key key}) : super(key: key);

  @override
  MessageState createState() => MessageState();
}

class MessageState extends State<Message> {
  final messages = [
      'No, you cannot.',
      'Foxo wins again!',
      'Is he too crafty for you?',
      'How Foxtastic!',
      'What does the foxo say?',
      'Better luck next time.',
      'Foxo remains undefeated.',
      'Foxo always wins!',
      'Minecraft has foxes too!',
  ];
  String message;

  MessageState() {
    final random = Random();
    final index = random.nextInt(this.messages.length);
    message = messages[index];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Text(
              'Can you outsmart foxo?',
              style: Theme.of(context).textTheme.title,
          ),
          padding: const EdgeInsets.symmetric(vertical: 10),
        ),
        Text(
          message,
          style: Theme.of(context).textTheme.subhead,
        ),
      ],
    );
  }
}

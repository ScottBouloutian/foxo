import 'package:flutter/material.dart';
import 'dart:math';

class Message extends StatefulWidget {
  Message({Key key}) : super(key: key);

  @override
  MessageState createState() => MessageState();
}

class MessageState extends State<Message> with TickerProviderStateMixin {
  String message;
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
  AnimationController controller;
  Animation animation;

  MessageState() {
    final random = Random();
    final index = random.nextInt(messages.length);
    message = messages[index];
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeIn,
    );
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
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
        FadeTransition(
          child: Text(
            message,
            style: Theme.of(context).textTheme.subhead,
          ),
          opacity: animation,
        ),
      ],
    );
  }
}

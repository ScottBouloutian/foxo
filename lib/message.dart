import 'package:flutter/material.dart';
import 'dart:math';

class Message extends StatefulWidget {
    Message({Key key}) : super(key: key);

    @override
    MessageState createState() => new MessageState();
}

class MessageState extends State<Message> {
    final messages = [
        'No, you cannot.',
        'Foxo wins again!',
        'Too crafty for you.',
        'Foxtastic!',
        'What does the foxo say?',
        'Better luck next time.',
        'Foxo remains undefeated.',
        'Foxo always wins!',
    ];
    String message;

    MessageState() {
        final random = new Random();
        final index = random.nextInt(this.messages.length);
        message = messages[index];
    }

    @override
    Widget build(BuildContext context) {
        return new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                new Text(
                    'Can you outsmart foxo?',
                    style: Theme.of(context).textTheme.title,
                ),
                new Text(
                    message,
                    style: Theme.of(context).textTheme.subhead,
                ),
            ],
        );
    }
}

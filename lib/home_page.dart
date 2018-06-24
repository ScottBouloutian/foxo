import 'package:flutter/material.dart';
import 'message.dart';
import 'cell.dart';

class HomePage extends StatefulWidget {
    HomePage({Key key, this.title}) : super(key: key);

    final String title;

    @override
    _HomePageState createState() => new _HomePageState();
}

// Home Screen State
class _HomePageState extends State<HomePage> {
    @override
    Widget build(BuildContext context) {
        return new Scaffold(
            appBar: new AppBar(
                title: new Text(widget.title),
            ),
            body: new Center(
                child: new Column(
                    children: [
                        new Message(),
                        new Cell(),
                    ]
                ),
            ),
        );
    }
}

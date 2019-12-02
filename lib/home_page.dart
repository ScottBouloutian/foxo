import 'package:flutter/material.dart';
import 'message.dart';
import 'cell.dart';
import 'score.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.title),
      ),
      body: Column(
        children: [
          Message(),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              children: List.generate(9, (index) {
                return Container(
                  child: GestureDetector(
                    onTap: () {
                      print('onTap called. $index');
                    },
                    child: Cell(),
                  ),
                  padding: const EdgeInsets.all(10),
                );
              }),
              padding: const EdgeInsets.all(20),
            )
          ),
          Row(
            children: [
              Expanded(
                child: Score(
                  title: 'Ties',
                  value: 0,
                ),
              ),
              Expanded(
                child: Image.asset('images/fox.png'),
              ),
              Expanded(
                child: Score(
                  title: 'Wins',
                  value: 0,
                ),
              ),
            ],
          ),
        ],
      )
    );
  }
}

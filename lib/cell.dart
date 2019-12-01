import 'package:flutter/material.dart';

class Cell extends StatelessWidget {
    @override Widget build(BuildContext context) {
        return new Container(
            decoration: new BoxDecoration(
                borderRadius: new BorderRadius.all(
                    Radius.circular(10.0),
                ),
                boxShadow: [
                    new BoxShadow(
                        color: Colors.grey[400],
                        offset: new Offset(5.0, 5.0),
                        blurRadius: 5.0,
                    )
                ],
                color: Colors.grey[300],
            ),
            height: 90.0,
            width: 90.0,
        );
    }
}

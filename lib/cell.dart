import 'package:flutter/material.dart';

class Cell extends StatelessWidget {
    @override Widget build(BuildContext context) {
        return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                ),
                boxShadow: [
                    BoxShadow(
                        color: Colors.grey[400],
                        offset: Offset(5.0, 5.0),
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

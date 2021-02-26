import 'package:flutter/material.dart';

class ScreenOne extends StatefulWidget {
  @override
  _ScreenOneState createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Screen One'),
          TextField(
            decoration: InputDecoration(hintText: 'Screen one'),
          ),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/two');
              },
              child: Text('Go two'))
        ],
      ),
    );
  }
}

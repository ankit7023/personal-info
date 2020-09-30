import 'package:flutter/material.dart';

class ScreenTile extends StatelessWidget {
  final String text;
  ScreenTile({@required this.text});
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1 ),
      duration: Duration(seconds: 2),
      curve: Curves.bounceIn,
      child: Text(text,
          style: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          color: Colors.white70
      )
      ),
      builder: (BuildContext context, double _val, Widget child) {
        return Opacity(
          opacity: _val,
          child: Padding(
              padding: EdgeInsets.only(top: _val * 50),
              child: child
          ),
        );
      },
    );
  }
}

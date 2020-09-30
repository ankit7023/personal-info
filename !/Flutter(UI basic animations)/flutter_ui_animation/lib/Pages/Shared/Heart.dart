import 'package:flutter/material.dart';
class Heart extends StatefulWidget {
  @override
  _HeartState createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Color> _coloranimation;
  bool pressed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 300),
      reverseDuration: Duration(milliseconds: 100),
      vsync: this
    );
    _coloranimation = ColorTween(begin: Colors.grey, end: Colors.red )
        .animate(_controller);
//      _curve = CurvedAnimation(
//      parent: _controller,
//      curve: Curves.bounceIn,
//    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed){
        pressed = true;
      }
      else if(status == AnimationStatus.dismissed){
        pressed = false;
      }
    });

  }
  @override
  void dispose(){
    super.dispose();
    _controller.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context,_){
        return IconButton(
          icon: Icon(Icons.favorite,
            color: _coloranimation.value,
          ),
          onPressed: (){
            pressed ? _controller.reverse():_controller.forward();
          },
        );

      },
    );
  }
}

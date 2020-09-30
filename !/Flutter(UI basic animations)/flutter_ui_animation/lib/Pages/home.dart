import 'package:flutter/material.dart';
import 'Shared/TripList.dart';
import 'package:flutteruianimation/Pages/Shared/ScreenTitle.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bg.png'),
            fit: BoxFit.fitWidth,
            alignment: Alignment.topLeft,

          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 30, 0),
              child: SizedBox(
                height: 160,
                child: ScreenTile(text: 'Trips')
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Flexible(
              child: TripList()
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutteruianimation/Pages/Shared/Trip.dart';
import 'package:flutteruianimation/Pages/Shared/Heart.dart';
import 'package:lipsum/lipsum.dart' as lipsum;
class Details extends StatelessWidget {
  final Trip trip;

  Details({@required this.trip});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: <Widget>[
          Hero(
            tag: trip.title,
            child: ClipRRect(
              child: Image.asset('images/${trip.img}',
                height: 360,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,

              ),
            ),
          ),
          SizedBox(height: 20,),
          ListTile(
            title: Text(trip.title,
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey[800],
                fontWeight: FontWeight.bold
              ),
            ),
            subtitle: Text('${trip.nights} nights stay for \$ ${trip.price}',
              style: TextStyle(
                fontSize: 14,
                letterSpacing: 1
              ),
            ),
            trailing: Heart(),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.fromLTRB(10,0,10,0),
            child: Text(
              lipsum.createText(
                numParagraphs: 1, numSentences: 4
              ),
              style: TextStyle(
                color: Colors.grey[600],

              ),
            ),
          )
        ],
      ),
    );
  }
}

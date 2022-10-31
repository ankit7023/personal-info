import 'package:flutter/material.dart';
import 'package:flutteruianimation/Pages/Shared/Trip.dart';
import 'package:flutteruianimation/Pages/Details.dart';

class TripList extends StatefulWidget {
  @override
  _TripListState createState() => _TripListState();
}

class _TripListState extends State<TripList> {
  final GlobalKey _listKey = GlobalKey();

  List<Widget> tripTiles = [];
  @override
  void initState() {
    super.initState();
    _addTrips();
  }
  void _addTrips(){
    List<Trip> _trips = [
      Trip(title: 'Beach Paradise', price: '350', nights: '3', img: 'beach.png'),
      Trip(title: 'City Break', price: '400', nights: '5', img: 'city.png'),
      Trip(title: 'Ski Adventure', price: '750', nights: '2', img: 'ski.png'),
      Trip(title: 'Space Blast', price: '600', nights: '4', img: 'space.png'),
    ];
    _trips.forEach((Trip trip){
      tripTiles.add(CreateTile(trip));
    });
  }
  Widget CreateTile(Trip trip){
    return ListTile(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Details(trip: trip)));
      },
      contentPadding: EdgeInsets.all(20),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('${trip.nights} nights',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blue[300])),
          Text(trip.title, style: TextStyle(fontSize: 20, color: Colors.grey[600])),
        ],
      ),
      leading: Hero(
        tag: trip.title,
        child: ClipRRect(
          child: Image.asset('images/${trip.img}', height: 50,),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      trailing: Text('${trip.price}\$',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Colors.black
      ),
      )
    );
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: _listKey,
      initialItemCount: tripTiles.length,
      itemBuilder: (context,index,animation) {
          return tripTiles[index];
        },
    );
  }
}

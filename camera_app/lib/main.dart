import 'package:camera_app/providers/great_places.dart';

import 'package:camera_app/screens/place_detail_screen.dart';
import 'package:camera_app/screens/place_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/add_place_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
      child: MaterialApp(
        title: 'Great Places',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.amber,
        ),
        home: PlaceListScreen(),
        routes: {
          '/addPlace': (ctx) => AddPlaceScreen(),
          '/placedetail': (ctx) => PlaceDetailSCreen(),
        },
      ),
    );
  }
}

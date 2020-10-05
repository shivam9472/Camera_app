import 'package:camera_app/providers/great_places.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'map_screen.dart';

class PlaceDetailSCreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments;
    final selectedPlace =
        Provider.of<GreatPlaces>(context, listen: false).findbyId(id);
    return Scaffold(
        appBar: AppBar(
          title: Text(selectedPlace.title),
        ),
        body: Column(
          children: <Widget>[
            Container(
              height: 250,
              width: double.infinity,
              child: Image.file(
                selectedPlace.image,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              selectedPlace.location.address,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            FlatButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    fullscreenDialog: true,
                    builder: (ctx) => MapScreen(
                          initialLocation: selectedPlace.location,
                          isSelecting: false,
                        )));
              },
              child: Text('view on map'),
              textColor: Theme.of(context).primaryColor,
            )
          ],
        ));
  }
}

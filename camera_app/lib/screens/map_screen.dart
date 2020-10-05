import 'package:camera_app/models/place.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  final PlaceLocation initialLocation;
  final bool isSelecting;
  MapScreen(
      {this.initialLocation = const PlaceLocation(
          latitude: 27.22, longitude: -34.15, address: 'Hello'),
      this.isSelecting = false});
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng _pickedLocation; //pair of latitude and longitude
  void _selectPosition(LatLng position) {
    setState(() {
      _pickedLocation = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Yoyr Map'),
          actions: <Widget>[
            if (widget.isSelecting)
              IconButton(
                icon: Icon(Icons.check),
                onPressed: _pickedLocation == null
                    ? null
                    : () {
                        Navigator.of(context).pop(_pickedLocation);
                      },
              )
          ],
        ),
        body: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(widget.initialLocation.latitude,
                widget.initialLocation.longitude),
            zoom: 16,
          ),
          onTap: widget.isSelecting ? _selectPosition : null,
          markers: _pickedLocation == null && widget.isSelecting
              ? null
              : {
                  Marker(
                    markerId: MarkerId('m1'),
                    position: _pickedLocation ??
                        LatLng(
                            widget.initialLocation.latitude,
                            widget.initialLocation
                                .longitude), //if _pickedlocation==null
                  ),
                },
        ));
  }
}

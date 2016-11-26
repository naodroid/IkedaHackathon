import 'package:flutter/material.dart';
import 'package:myapp2/model/geolocation.dart';

class PinnedMapView extends StatelessWidget {
  final Geolocation location;
  PinnedMapView(this.location, {Key key}) : super(key: key) {
  }

  @override
  Widget build(BuildContext context) {
    final lat = location.latitude;
    final lon = location.longitude;
    final url = "http://maps.google.com/maps/api/staticmap?center=$lat,$lon&size=320x140&zoom=17&sensor=false";

    return new Stack(
      children: [
        new Positioned(
          left: 0.0,
          right: 0.0,
          top: 0.0,
          bottom: 0.0,
          child: new Image.network(
            url,
            fit: ImageFit.cover,
          )
        ),
        new Center(
          child: new Image.asset("assets/map_pin.png")
        ),
      ]
    );
  }
}

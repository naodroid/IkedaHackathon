import 'package:flutter/material.dart';
import 'package:myapp2/model/geolocation.dart';
import 'package:vector_math/vector_math_64.dart' as math;

class PinnedMapView extends StatelessWidget {
  final Geolocation location;
  final double orientation;
  final int zoom;

  PinnedMapView(this.location, {Key key, this.orientation, this.zoom}) : super(key: key) {
  }

  @override
  Widget build(BuildContext context) {
    final lat = location.latitude;
    final lon = location.longitude;
    int zoom = this.zoom ?? 17;
    final url = "http://maps.google.com/maps/api/staticmap?center=$lat,$lon&size=320x140&zoom=${zoom}&sensor=false";

    List<Widget> children = new List<Widget>();
    children.add(
      new Positioned(
        left: 0.0,
        right: 0.0,
        top: 0.0,
        bottom: 0.0,
        child: new Image.network(
          url,
          fit: ImageFit.cover,
        )
      )
    );
    if (this.orientation != null) {
      Matrix4 matrix = new Matrix4.identity();
      matrix.rotate(new math.Vector3(0.0, 0.0, 1.0), this.orientation);
      children.add(
        new Positioned(
          right: 0.0,
          bottom: 0.0,
          child: new Transform(
            transform: matrix,
            child: new Text("↑"),
          )
        )
      );
    }
    children.add(
      new Center(
        child: new Image.asset("assets/map_pin.png")
      )
    );


    return new Stack(
      children: children
    );
  }
}

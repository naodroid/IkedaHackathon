import 'package:flutter/material.dart';
import 'package:myapp2/common/pinned_map_view.dart';
import 'package:myapp2/model/geolocation.dart';
import 'package:myapp2/model/spot.dart';
import 'package:myapp2/model/vending_machines.dart';
import 'package:myapp2/styles/basic_styles.dart';
import 'package:myapp2/store/my_location_store.dart';


class SpotDetailPage extends StatelessWidget {
  final Spot spot;

  SpotDetailPage(this.spot, {Key key}) : super(key: key) {
  }


  @override
  Widget build(BuildContext context) {
    final myLocation = MyLocationStore.getInstance().getMyLocation();
    final distance = spot.location.distanceTo(myLocation).toInt();

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(spot.name),
        actions: <Widget> [
          new GestureDetector(
            onTap: () => _onBackClick(context),
            child: new Text("＜")
          ),
        ],
      ),
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          new Container(width: 0.0, height: 8.0),
          new Text("スポット詳細"),
          new Container(
            height: 140.0,
            child: new PinnedMapView(spot.location),
          ),
          new Padding(
            padding: new EdgeInsets.all(8.0),
            child: new Column(
              children: [
                new Text("[${spot.category1}]  [${spot.category2}]"),
                new Text("${spot.description}"),
              ],
            ),
          ),

          new Image.network(spot.imageUrl),
        ]
      )
    );
  }
  void _onBackClick(BuildContext context) {
    Navigator.pop(context);
  }
}


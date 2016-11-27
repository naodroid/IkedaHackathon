import 'package:flutter/material.dart';
import 'package:myapp2/common/pinned_map_view.dart';
import 'package:myapp2/model/geolocation.dart';
import 'package:myapp2/model/spot.dart';
import 'package:myapp2/model/vending_machines.dart';
import 'package:myapp2/pages/spot_detail_page.dart';
import 'package:myapp2/styles/basic_styles.dart';
import 'package:myapp2/store/my_location_store.dart';

class _CellItem {
  final Spot spot;
  final double distance;
  _CellItem(this.spot, this.distance);
}

class MachineDetailPage extends StatelessWidget {
  final VendingMachine machine;

  MachineDetailPage(this.machine, {Key key}) : super(key: key) {

  }


  @override
  Widget build(BuildContext context) {
    final myLocation = MyLocationStore.getInstance().getMyLocation();
    final distance = machine.location.distanceTo(myLocation).toInt();

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("自販機詳細"),
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
          new Text("自販機詳細"),
          new Container(
            height: 120.0,
            child: new PinnedMapView(machine.location),
          ),
          new Container(width: 0.0, height: 4.0),
          new Text("ここからの距離 ${distance}m"),
          new Padding(
            padding: new EdgeInsets.all(8.0),
            child: new Container(height: 1.0, decoration: kSeparatorStyle),
          ),
          new Text("周辺情報"),
          new Flexible(
            flex: 1,
            child: new ScrollableList(
              itemExtent: 200.0,
              children: _createCells(),
            )
          )
        ]
      )
    );
  }
  List<Widget> _createCells() {
    //search spots near by
    final spots = Spot.items.map((Spot spot) {
      final distance = machine.location.distanceTo(spot.location);
      return new _CellItem(spot, distance);
    })
      .where((_CellItem item) => item.distance < 5000.0);

    return spots.map((_CellItem item) => new _SpotCell(item)).toList();
  }
  void _onBackClick(BuildContext context) {
    Navigator.pop(context);
  }
}

class _SpotCell extends StatelessWidget {

  final _CellItem item;
  _SpotCell(this.item, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final spot = item.spot;
    final distance = item.distance.toInt();

    return new Padding(
      padding: new EdgeInsets.all(8.0),
      child: new GestureDetector(
        onTap: () => _onCellTap(context),
        child: new Container(
          padding: new EdgeInsets.all(8.0),
          decoration: kCellParentStyle,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: <Widget>[
              new Text(spot.name, style: kMainTextStyle),
              new Container(width: 0.0, height: 8.0),
              new Flexible(
                flex: 1,
                child: new Image.network(item.spot.imageUrl)
              ),
              new Container(width: 0.0, height: 8.0),
              new Text(spot.description, style: kSubTextStyle),
              new Text("自販機からの距離 ${distance}m", style: kSubTextStyle),
            ]
          )
        )
      )
    );
  }
  void _onCellTap(BuildContext context) {
    final route = new MaterialPageRoute<Null>(
      builder: (context) => new SpotDetailPage(item.spot)
    );
    Navigator.push(context, route);
  }
}
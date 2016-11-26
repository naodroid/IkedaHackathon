import 'package:flutter/material.dart';

import 'package:myapp2/model/vending_machines.dart';
import 'package:myapp2/styles/basic_styles.dart';
import 'package:myapp2/common/geolocation.dart';

//現在地。本来はGPS取得したい
final double _currentLat = 35.858458;
final double _currentLng = 136.304374;
//
class _ListItem {
  final VendingMachine machine;
  final double distance;

  _ListItem(VendingMachine machine) :
      this.machine = machine,
      this.distance = GeolocationUtil.calcDistance(
        _currentLat, _currentLng,
        machine.latitude, machine.longitude)
  {
  }
}


//----------------------------------
class MachineListPage extends StatelessWidget {
  final List<_ListItem> items = VendingMachine.items
    .map((item) => new _ListItem(item))
    .toList()
    ..sort((a, b) => (a.distance - b.distance).toInt());

  MachineListPage({Key key}) : super(key: key) {
  }

  @override
  Widget build(BuildContext context) {
    return new ScrollableList(
      itemExtent: 150.0,
      children: _createCells()
    );
  }

  Iterable<Widget> _createCells() {
    return items.map(
      (item) => new MapCellItem(item)
    );
  }
}

class MapCellItem extends StatelessWidget {

  final _ListItem item;
  MapCellItem(this.item, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lat = item.machine.latitude;
    final lon = item.machine.longitude;
    final url = "http://maps.google.com/maps/api/staticmap?center=$lat,$lon&size=320x150&zoom=17&sensor=false";
    final distance = item.distance.toInt();

    return new Padding(
      padding: new EdgeInsets.all(8.0),
      child: new Container(
        decoration: kCellParentStyle,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: <Widget>[
            new Flexible(
              flex: 1,
              child: new Image.network(
                url,
                fit: ImageFit.fill
              ),
            ),
            new Text("距離 $distance m")
          ]
        )
      )
    );
  }
}
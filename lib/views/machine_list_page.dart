import 'package:flutter/material.dart';

import 'package:myapp2/model/vending_machines.dart';
import 'package:myapp2/styles/basic_styles.dart';
import 'package:myapp2/model/geolocation.dart';
import 'package:myapp2/store/my_location_store.dart';
import 'package:myapp2/common/store.dart';

//現在地。本来はGPS取得したい
final Geolocation _kMyLocation = new Geolocation(35.858458, 136.304374);
//
class _ListItem {
  final VendingMachine machine;
  final double distance;

  _ListItem(VendingMachine machine) :
      this.machine = machine,
      this.distance = machine.location.distanceTo(_kMyLocation);
}


//----------------------------------
class MachineListPage extends StatefulWidget {

  @override
  State createState() => new _MachineListPageState();
}
class _MachineListPageState extends State<MachineListPage> implements StateObserver<Geolocation> {
  Geolocation _myLocation;

  @override
  void initState() {
    super.initState();
    final store = MyLocationStore.getInstance();
    _myLocation = store.getMyLocation();
    store.addObserver(this);
  }


  @override
  void deactivate() {
    MyLocationStore.getInstance().removeObserver(this);

    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    List<_ListItem> _items = _getSortedItem(_myLocation, VendingMachine.items);

    return new ScrollableList(
      itemExtent: 150.0,
      children: _createCells(_items)
    );
  }

  Iterable<Widget> _createCells(List<_ListItem> items) {
    return items.map(
        (item) => new MapCellItem(item)
    );
  }


  static List<_ListItem> _getSortedItem(Geolocation myLocation, List<VendingMachine> machines) {
    return machines.map((item) => new _ListItem(item))
      .toList()
      ..sort((_ListItem a, _ListItem b) => (a.distance - b.distance).toInt());
  }

  @override
  void onStateUpdated(Geolocation state) {
    setState(() {
      _myLocation = state;
    });
  }
}



class MapCellItem extends StatelessWidget {

  final _ListItem item;
  MapCellItem(this.item, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lat = item.machine.location.latitude;
    final lon = item.machine.location.longitude;
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
            new Text("Distance ${distance}m")
          ]
        )
      )
    );
  }

}
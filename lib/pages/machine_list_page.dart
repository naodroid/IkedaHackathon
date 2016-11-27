import 'package:flutter/material.dart';

import 'package:myapp2/common/store.dart';
import 'package:myapp2/common/pinned_map_view.dart';
import 'package:myapp2/model/geolocation.dart';
import 'package:myapp2/model/vending_machines.dart';
import 'machine_detail_page.dart';
import 'package:myapp2/styles/basic_styles.dart';
import 'package:myapp2/store/my_location_store.dart';

//
class _ListItem {
  final VendingMachine machine;
  final double distance;
  final double orientation;

  _ListItem(VendingMachine machine, Geolocation myLocation) :
      this.machine = machine,
      this.distance = machine.location.distanceTo(myLocation),
      this.orientation = machine.location.orientationTo(myLocation);
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
        (item) => new _MapCellItem(item)
    );
  }


  static List<_ListItem> _getSortedItem(Geolocation myLocation, List<VendingMachine> machines) {
    return machines.map((item) => new _ListItem(item, myLocation))
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



class _MapCellItem extends StatelessWidget {

  final _ListItem item;
  _MapCellItem(this.item, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final distance = item.distance.toInt();

    return new Padding(
      padding: new EdgeInsets.all(8.0),
      child: new GestureDetector(
        onTap: () => onCellTap(context),
        child: new Container(
          decoration: kCellParentStyle,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: <Widget>[
              new Flexible(
                flex: 1,
                child: new PinnedMapView(
                  item.machine.location,
                  orientation: item.orientation,
                  zoom: 15),
              ),
              new Text("Distance ${distance}m")
            ]
          )
        )
      )
    );
  }
  void onCellTap(BuildContext context) {
    final route = new MaterialPageRoute<Null>(
      builder: (context) => new MachineDetailPage(item.machine)
    );
    Navigator.push(context, route);
  }
}
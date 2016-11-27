import 'package:flutter/material.dart';

import 'package:myapp2/common/store.dart';
import 'package:myapp2/model/geolocation.dart';
import 'package:myapp2/model/toilet.dart';
import 'package:myapp2/store/my_location_store.dart';
import 'package:myapp2/styles/basic_styles.dart';
import 'package:myapp2/common/store.dart';
import 'package:myapp2/common/pinned_map_view.dart';

//
class _ListItem {
  final Toilet toilet;
  final double distance;

  _ListItem(Toilet toilet, Geolocation myLocation) :
      this.toilet = toilet,
      this.distance = toilet.location.distanceTo(myLocation);
}


//----------------------------------
class ToiletListPage extends StatefulWidget {

  @override
  State createState() => new _ToiletListPageState();
}
class _ToiletListPageState extends State<ToiletListPage> implements StateObserver<Geolocation> {
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
    List<_ListItem> _items = _getSortedItem(_myLocation, Toilet.items);

    return new ScrollableList(
      itemExtent: 200.0,
      children: _createCells(_items)
    );
  }

  Iterable<Widget> _createCells(List<_ListItem> items) {
    return items.map(
        (item) => new _MapCellItem(item)
    );
  }


  static List<_ListItem> _getSortedItem(Geolocation myLocation, List<Toilet> machines) {
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
    final lat = item.toilet.location.latitude;
    final lon = item.toilet.location.longitude;
    final url = "http://maps.google.com/maps/api/staticmap?center=$lat,$lon&size=320x150&zoom=17&sensor=false";
    final distance = item.distance.toInt();
    final Toilet toilet = item.toilet;

    final String text1 = "男性トイレ ${toilet.manCount} 女性トイレ ${toilet.womanCount}";
    final String text2 = "利用可能時間 ${toilet.openTime} - ${toilet.closeTime}";
    String appendText = "${toilet.notice}\n";
    if (toilet.hasBabyBed) {
      appendText += "ベイビーベッド有り ";
    }
    if (toilet.hasOstomate) {
      appendText += "オストメイト有り ";
    }

    return new Padding(
      padding: new EdgeInsets.all(8.0),
      child: new Container(
        decoration: kCellParentStyle,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: <Widget>[
            new Flexible(
              flex: 1,
              child: new PinnedMapView(toilet.location)
            ),
            new Text("Distance ${distance}m"),
            new Text(text1),
            new Text(text2),
            new Text(appendText),
          ]
        )
      )
    );
  }
}
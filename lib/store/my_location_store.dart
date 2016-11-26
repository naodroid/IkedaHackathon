import 'package:myapp2/common/store.dart';
import 'package:myapp2/model/geolocation.dart';


final Geolocation _kMyLocation = new Geolocation(35.858458, 136.304374);
//No Location API in Flutter.So using fixed-location.
class MyLocationStore extends Store<Geolocation> {
  Geolocation _myLocation = _kMyLocation;

  Geolocation getMyLocation() {
    return _myLocation;
  }

  void onLocationUpdated(Geolocation location) {
    _myLocation = location;
    notifyChanged(_myLocation);
  }


  static MyLocationStore _instance = null;
  static MyLocationStore getInstance() {
    if (_instance == null) {
      _instance = new MyLocationStore();
    }
    return _instance;
  }
}






import 'geolocation.dart';

class VendingMachine {
  final Geolocation location;

  VendingMachine(double lat, double lon)
    : this.location = new Geolocation(lat, lon);


  //CSVから緯度経度のみ抽出。ほかはいらない
  static final items = <VendingMachine>[
    new VendingMachine(35.888104, 136.339177),
    new VendingMachine(35.885226, 136.336456),
    new VendingMachine(35.883005, 136.324893),
    new VendingMachine(35.876208, 136.332012),
    new VendingMachine(35.863115, 136.319588),
    new VendingMachine(35.861902, 136.317689),
    new VendingMachine(35.857491, 136.306715),
    new VendingMachine(35.857491, 136.306715),
    new VendingMachine(35.85592, 136.30784),
    new VendingMachine(35.885608, 136.343403),
    new VendingMachine(35.886408, 136.34358),
    new VendingMachine(35.888507, 136.344249),
    new VendingMachine(35.888507, 136.344249),
    new VendingMachine(35.890473, 136.345049),
    new VendingMachine(35.891143, 136.345938),
    new VendingMachine(35.899507, 136.354533),
    new VendingMachine(35.894631, 136.346592),
    new VendingMachine(35.891129, 136.344007),
    new VendingMachine(35.891197, 136.344102),
    new VendingMachine(35.889961, 136.343152),
    new VendingMachine(35.888951, 136.342729),
    new VendingMachine(35.888951, 136.342729),
    new VendingMachine(35.888372, 136.342928),
    new VendingMachine(35.890153, 136.341107),
    new VendingMachine(35.885599, 136.342144),
    new VendingMachine(35.881716, 136.336466),
    new VendingMachine(35.881716, 136.336466),
    new VendingMachine(35.881515, 136.336385),
    new VendingMachine(35.860263, 136.365045),
    new VendingMachine(35.861291, 136.363371),
    new VendingMachine(35.862237, 136.367476),
    new VendingMachine(35.861867, 136.368191),
    new VendingMachine(35.864982, 136.362749),
    new VendingMachine(35.865256, 136.364182),
    new VendingMachine(35.90068, 136.355854),
    new VendingMachine(35.905892, 136.35535),
    new VendingMachine(35.899412, 136.35705),
    new VendingMachine(35.886639, 136.36822),
    new VendingMachine(35.886484, 136.369909),
    new VendingMachine(35.884527, 136.372591),
    new VendingMachine(35.91863, 136.352055),
    new VendingMachine(35.919239, 136.349812),
    new VendingMachine(35.918519, 136.349009),
    new VendingMachine(35.918046, 136.344844),
    new VendingMachine(35.917942, 136.344059),
    new VendingMachine(35.916911, 136.341738),
    new VendingMachine(35.944119, 136.359384),
    new VendingMachine(35.944451, 136.358348),
    new VendingMachine(35.943626, 136.36878),
    new VendingMachine(35.942569, 136.373001),
    new VendingMachine(35.916487, 136.334757)
    ];
}



import 'dart:math';

final double BESSEL_A = 6377397.155;
final double BESSEL_E2 = 0.00667436061028297;
final double BESSEL_MNUM = 6334832.10663254;


class Geolocation {
  final double latitude;
  final double longitude;

  Geolocation(this.latitude, this.longitude);

  double distanceTo(Geolocation other) {
    return calcDistance(this.latitude, this.longitude, other.latitude, other.longitude);
  }
  static double distance(Geolocation loc1, Geolocation loc2) {
    return loc1.distanceTo(loc2);
  }

  //
  static double deg2rad(double deg) {
    return deg * PI / 180.0;
  }
  //二点間の距離を計算する。メートル単位でかえる
  //http://yamadarake.jp/trdi/report000001.html
  static double calcDistance(double lat1, double lng1, double lat2, double lng2) {
    final my = deg2rad((lat1 + lat2) / 2.0);
    final dy = deg2rad(lat1 - lat2);
    final dx = deg2rad(lng1 - lng2);

    final sinVal = sin(my);
    final w = sqrt(1.0 - BESSEL_E2 * sinVal * sinVal);
    final m = BESSEL_MNUM / (w * w * w);
    final n = BESSEL_A / w;

    final dym = dy * m;
    final dxncos = dx * n * cos(my);

    return sqrt(dym * dym + dxncos * dxncos);
  }
}


class GeolocationHolder {
  final Geolocation location;

  GeolocationHolder(this.location);
}
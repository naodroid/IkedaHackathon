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

  double orientationTo(Geolocation other) {
    return calcOrientation(this.latitude, this.longitude, other.latitude, other.longitude);
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
  //二点間の方位を計算する。
  //http://tomari.org/main/java/gps5.html
  //North: 0  East M_PI / 2  South: M_PI  West: M_PI * 3 / 2
  static double calcOrientation(double lat1, double lng1, double lat2, double lng2) {
    double x1 = deg2rad(lng1);
    double x2 = deg2rad(lng2);
    double y1 = deg2rad(lat1);
    double y2 = deg2rad(lat2);

    return (PI / 2) - atan2(sin(x2-x1),cos(y1) * tan(y2) - sin(y1) * cos(x2 - x1));
  }
}


class GeolocationHolder {
  final Geolocation location;

  GeolocationHolder(this.location);
}
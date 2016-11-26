import 'geolocation.dart';

class Toilet {
  final String name;
  final int manCount;
  final int womanCount;
  final bool hasBabyBed;
  final bool hasOstomate;
  final String openTime;
  final String closeTime;
  final String notice;
  final Geolocation location;

  Toilet(this.name,
    this.manCount, this.womanCount,
    this.hasBabyBed, this.hasOstomate,
    this.openTime, this.closeTime, this.notice,
    double latitude, double longitude) :
    this.location = new Geolocation(latitude, longitude);


  static List<Toilet> items = [
    new Toilet(
      "池田町役場",
      5, 2,
      false, false,
      "8:30:00", "17:15:00",
      "",
      35.890448, 136.34409),

    new Toilet(
      "池田町文化交流会館",
      10, 8,
      false, false,
      "9:00:00", "16:00:00",
      "",
      35.894771, 136.344908),

    new Toilet(
      "わいわいドーム",
      2, 2,
      false, false,
      "0:00:00", "24:00:00",
      "",
      35.918758, 136.351404),

    new Toilet(
      "かずら橋駐車場",
      5, 2,
      true, false,
      "0:00:00", "24:00:00",
      "",
      35.861294, 136.363447),

    new Toilet(
      "池田町農業公社",
      2, 1,
      false, false,
      "9:00:00", "17:00:00",
      "平日のみ",
      35.893798, 136.346187),

    new Toilet(
      "こってコテいけだ",
      5, 3,
      true, true,
      "8:00:00", "19:00:00",
      "",
      35.892968, 136.345061),

    new Toilet(
      "能楽の里歴史館",
      2, 2,
      false, false,
      "10:00:00", "16:00:00", "",
      35.886763, 136.344579),

    new Toilet(
      "堀口家",
      2, 1,
      false, false,
      "9:00:00", "17:00:00", "",
      35.89008, 136.346158),

    new Toilet(
      "ツリーピクニックアドベンチャーセンターハウス",
      5, 4,
      true, false,
      "10:00:00", "17:00:00",
      "木曜休み",
      35.862301, 136.36739),

    new Toilet(
      "おもちゃハウスこどもと木",
      1, 1, true, true,
      "10:00:00", "16:00:00",
      "火曜休み。子供用トイレ有。",
      35.893222, 136.345304),

    new Toilet(
      "ふれあい物産館",
      2, 2, true, false,
      "10:00:00", "16:00:00", "",
      35.885521, 136.343414)
  ];
}

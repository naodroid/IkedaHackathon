import 'package:flutter/material.dart';


final kCellParentStyle = new BoxDecoration(
  backgroundColor: const Color(0xFFF8F8F8),
  border: new Border.all(
    width: 1.0,
    color: const Color(0xFFDDDDDD)
  ),
  boxShadow: <BoxShadow> [
    new BoxShadow(
      color: const Color(0x40000000),
      blurRadius: 3.0,
    )
    ],
);
final kSeparatorStyle = new BoxDecoration(
  backgroundColor: const Color(0xFFA0A0A0),
);

final kMainTextStyle = new TextStyle(
  color: const Color(0xFF404040),
  fontSize: 16.0,
);
final kSubTextStyle = new TextStyle(
  color: const Color(0xFF808080),
  fontSize: 12.0,
);
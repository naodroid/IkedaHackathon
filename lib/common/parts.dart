import 'package:flutter/widgets.dart';

class ButtonStyle extends TextStyle {

}


class Button extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final GestureTapCallback onTap;
  final Color backgroundColor;
  final EdgeInsets padding;

  Button(this.text, {
    Key key, this.textStyle, this.onTap,
    this.backgroundColor, this.padding}) : super(key : key) {
  }


  @override
  Widget build(BuildContext context) {
    final padding = this.padding ?? new EdgeInsets.all(8.0);

    return new GestureDetector(
      onTap: this.onTap,
      child: new Container(
        decoration: new BoxDecoration(backgroundColor: this.backgroundColor),
        child: new Padding(
          padding: padding,
          child: new Text(this.text, style: this.textStyle)
        )
      )
    );
  }
}


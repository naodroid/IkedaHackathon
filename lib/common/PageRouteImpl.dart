import 'package:flutter/widgets.dart';

class PageRouteImpl extends PageRoute<Null> {

  final WidgetBuilder builder;


  PageRouteImpl(this.builder, {RouteSettings settings}) : super(settings: settings) {
  }

  @override
  Color get barrierColor => new Color.fromARGB(255, 0, 0, 255);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> forwardAnimation) {
    debugPrint("BUILD");
    return builder(context);
  }

  // TODO: implement maintainState
  @override
  bool get maintainState => true;

  // TODO: implement transitionDuration
  @override
  Duration get transitionDuration => new Duration(milliseconds: 300);
}
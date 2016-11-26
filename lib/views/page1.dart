import 'package:flutter/material.dart';

import 'package:myapp2/common/parts.dart';
import 'package:myapp2/common/PageRouteImpl.dart';
import 'page2.dart';

class Page1Widget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Hackathon")
      ),
      body: new Center(
        child: new Text("HOGE")
      )
    );
  }
  void showNext(BuildContext context) {
    Navigator.pushNamed(context, "/page2");
  }


}








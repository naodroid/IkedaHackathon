import 'package:flutter/material.dart';

import 'machine_list_page.dart';
import 'toilet_list_page.dart';

//-------------------------------------------------
class MainPage extends StatefulWidget {
  @override
  State createState() => new _MainPageState();
}
class _MainPageState extends State<MainPage> {
  int _currentTab = 0;
  //
  @override
  void initState() {
    super.initState();
    _currentTab = 0;
  }

  @override
  Widget build(BuildContext context) {
    final Widget body = _pageForCurrentTab();


    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Ikeda Hackathon"),
      ),
      body: body,
      bottomNavigationBar: new BottomNavigationBar(
        labels: <DestinationLabel>[
          new DestinationLabel(
            icon: new Icon(Icons.apps),
            title: new Text("自販機")
          ),
          new DestinationLabel(
            icon: new Icon(Icons.directions_run),
            title: new Text("トイレ")
          ),
          new DestinationLabel(
            icon: new Icon(Icons.fastfood),
            title: new Text("ご飯")
          )
        ],
        onTap: (int index) {
          setState(() => _currentTab = index);
        },
        currentIndex: _currentTab,
      )
    );
  }

  Widget _pageForCurrentTab() {
    if (_currentTab == 0) {
      return new MachineListPage();
    }
    if (_currentTab == 1) {
      return new ToiletListPage();
    }
    return new Text("HOGE");
  }
}

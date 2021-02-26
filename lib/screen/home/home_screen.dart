import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:tab_bar_fragment/screen/home/screens/screen_controller.dart';

import 'components/tabs.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  BuildContext contextScreen;
  Queue<BuildContext> _queue = Queue();
  TabController _tabController;

  final _lengthTabs = 3;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _lengthTabs, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _enableBack,
      child: DefaultTabController(
          length: _lengthTabs,
          child: Scaffold(
            appBar: AppBar(
              title: Text('Tab bar'),
            ),
            bottomNavigationBar: Tabs(tabController: _tabController),
            body: TabBarView(
              controller: _tabController,
              children: <Widget>[
                ScreenController(
                  updateContext: (context) {
                    contextScreen = context;
                    _queue.addLast(context);
                  },
                ),
                Center(
                  child: Icon(Icons.youtube_searched_for),
                ),
                Center(
                  child: Text('Text with style'),
                )
              ],
            ),
          )),
    );
  }

  Future<bool> _enableBack() async {
    if (_tabController.index == 0 && _queue.isNotEmpty) {
      Navigator.of(_queue.removeLast()).pop();
      return _queue.length == 0;
    }
    if (_tabController.index != 0) {
      _tabController.index = 0;
      return false;
    }

    return true;
  }
}

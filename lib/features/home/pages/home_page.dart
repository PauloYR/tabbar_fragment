import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:tab_bar_fragment/features/home/widgets/tabs.dart';
import 'package:tab_bar_fragment/features/screen/pages/screen_main_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final _queue = Queue();
  late final TabController _tabController;
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
            bottomNavigationBar:
                SafeArea(child: Tabs(tabController: _tabController)),
            body: TabBarView(
              controller: _tabController,
              children: <Widget>[
                ScreenMainPage(
                  updateContext: (context) {
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
    } else if (_tabController.index != 0) {
      _tabController.index = 0;
      return false;
    }
    return true;
  }
}

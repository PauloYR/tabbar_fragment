import 'package:flutter/material.dart';

class Tabs extends StatelessWidget {
  const Tabs({
    Key key,
    @required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorSize: TabBarIndicatorSize.tab,
      controller: _tabController,
      tabs: [
        Icon(
          Icons.home,
          color: Colors.black,
        ),
        Icon(
          Icons.check,
          color: Colors.black,
        ),
        Icon(
          Icons.sanitizer,
          color: Colors.black,
        )
      ],
    );
  }
}

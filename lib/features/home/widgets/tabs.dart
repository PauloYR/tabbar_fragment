import 'package:flutter/material.dart';

class Tabs extends StatelessWidget {
  const Tabs({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorSize: TabBarIndicatorSize.tab,
      controller: tabController,
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

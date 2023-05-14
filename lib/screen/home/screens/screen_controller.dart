import 'package:flutter/material.dart';

import 'screen_one.dart';
import 'screen_two.dart';

class ScreenController extends StatefulWidget {
  final Function(BuildContext context)? updateContext;

  const ScreenController({super.key, this.updateContext});

  @override
  _ScreenControllerState createState() => _ScreenControllerState();
}

class _ScreenControllerState extends State<ScreenController>
    with AutomaticKeepAliveClientMixin<ScreenController> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Navigator(
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
            settings: settings,
            builder: (BuildContext context) {
              if (widget.updateContext != null) widget.updateContext!(context);
              switch (settings.name) {
                case '/':
                  return ScreenOne();
                case '/two':
                  return ScreenTwo();
                default:
                  return ScreenOne();
              }
            });
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}

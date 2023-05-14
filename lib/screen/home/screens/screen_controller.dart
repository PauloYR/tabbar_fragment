import 'package:flutter/material.dart';

import 'screen_one.dart';
import 'screen_two.dart';

class ScreenController extends StatefulWidget {
  final Function(BuildContext context) updateContext;

  const ScreenController({Key key, this.updateContext}) : super(key: key);

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
              widget.updateContext(context);
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

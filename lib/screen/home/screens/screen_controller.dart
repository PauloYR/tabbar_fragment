import 'package:flutter/material.dart';

import 'screen_one.dart';
import 'screen_two.dart';

class ScreenController extends StatelessWidget {
  final Function(BuildContext context) updateContext;

  const ScreenController({Key key, this.updateContext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
            settings: settings,
            builder: (BuildContext context) {
              updateContext(context);
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
}

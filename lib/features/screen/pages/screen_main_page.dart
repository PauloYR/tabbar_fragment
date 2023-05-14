import 'package:flutter/material.dart';

part 'screen_one_page.dart';
part 'screen_two_page.dart';

class ScreenMainPage extends StatefulWidget {
  final Function(BuildContext context)? updateContext;

  const ScreenMainPage({super.key, this.updateContext});

  @override
  _ScreenMainPageState createState() => _ScreenMainPageState();
}

class _ScreenMainPageState extends State<ScreenMainPage>
    with AutomaticKeepAliveClientMixin<ScreenMainPage> {
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
                  return ScreenOnePage();
                case '/two':
                  return ScreenTwoPage();
                default:
                  return ScreenOnePage();
              }
            });
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}

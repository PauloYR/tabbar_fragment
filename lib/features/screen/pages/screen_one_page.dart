part of 'screen_main_page.dart';

class ScreenOnePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Screen One'),
          TextField(
            decoration: InputDecoration(hintText: 'Screen one'),
          ),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/two');
              },
              child: Text('Go two'))
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:live_wallpaper_app_03/screen/screen_b.dart';

class ScreenA extends StatefulWidget {
  @override
  State<ScreenA> createState() => _ScreenAState();
}

class _ScreenAState extends State<ScreenA> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen A'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Screen A',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ScreenB()),
                );
              },
              child: Text('Go to Screen B'),
            ),
          ],
        ),
      ),
    );
  }
}

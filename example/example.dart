import 'package:flutter/material.dart';
import 'package:lite_switch/lite_switch.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _LiteSwitchState createState() => new _LiteSwitchState();
}

class _LiteSwitchState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 0),
              child: LiteSwitch(
                value: true,
                textSize: 16.0,
                iWidth: 140,
                iHeight: 40,
                textOn: 'Sound ON',
                textOff: 'Sound Off',
                colorOn: Colors.deepOrange,
                colorOff: Colors.black,
                iconOn: Icons.volume_up,
                iconOff: Icons.volume_off,
                onChanged: (bool state) {
                  print('turned ${(state) ? 'on' : 'off'}');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

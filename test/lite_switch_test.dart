import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:lite_switch/lite_switch.dart';

void main() => runApp(testswitch());
class testswitch extends StatefulWidget {
  @override
  _TextFieldExState createState() => new _TextFieldExState();
}

class _TextFieldExState extends State<testswitch> {
  TextEditingController _c;

  @override
  void initState() {
    _c = new TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _c?.dispose();
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
              child: liteswitch(
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


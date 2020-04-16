import 'package:flutter/material.dart';
import 'package:lite_switch/lite_switch.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _LiteSwitchState createState() => new _LiteSwitchState();
}

class _LiteSwitchState extends State<MyApp> {
  final ValueNotifier<bool> SwitchState = new ValueNotifier<bool>(true);
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LiteSwitch(
              switchState: SwitchState,
              initValue: true,
              textSize: 14.0,
              iWidth: 140,
              iHeight: 60,
              textOn: 'Sound ON',
              textOff: 'Sound Off',
              colorOn: Colors.deepOrange,
              colorOff: Colors.black,
              iconOn: Icons.volume_up,
              iconOff: Icons.volume_off,
              onChanged: (bool state) {
                setState(() {
                  SwitchState.value = !SwitchState.value;
                  print('turned ${(state) ? 'on' : 'off'}');
                });

              },
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  SwitchState.value = !SwitchState.value;
                  print(
                      'onPressed ${(SwitchState.value) ? 'on' : 'off'}');
                });
              },
              child: Text("On/Off"),
            ),
            Text("State:${(SwitchState.value) ? 'on' : 'off'}"),
          ],
        ),
      ),
    );
  }
}

# Lite Switch
Lite Switch is a customized switch which you can add or change text and icon for "On" and "Off".
You can also set the width and height for the switch in your app.
Check github: https://github.com/galacticpuffin/lite_switch

## Features
* [New] Trigger the switch to change through the ValueNotifier<bool> SwitchState. So you can control how the switch shows from your app.
* Get the switch value change through implementing the onChanged.
* Set iWidth and iHeight to get the right size for your switch.
* Customize your text and icon for switch "On" and "Off".

## Screenshot
 <img height="414" src="https://github.com/galacticpuffin/lite_switch/raw/master/assets/images/on.png">
 <img height="414" src="https://github.com/galacticpuffin/lite_switch/raw/master/assets/images/off.png">
 <img height="414" src="https://github.com/galacticpuffin/lite_switch/raw/master/assets/images/switchStateOff.png">
 <img height="414" src="https://github.com/galacticpuffin/lite_switch/raw/master/assets/images/switchStateOn.png">

## Usage
To use this plugin :
```dart
Add the dependency to your pubspec.yaml file.
  dependencies:
    flutter:
      sdk: flutter
      lite_switch:
```

## Example
```dart
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
```
# Lite Switch
Lite Switch is a customized switch which you can add or change text and icon for "On" and "Off".
You can also set the width and height for the switch in your app.

## Screenshot
 <img height="414" src="https://github.com/galacticpuffin/lite_switch/raw/master/assets/images/on.png">
 <img height="414" src="https://github.com/galacticpuffin/lite_switch/raw/master/assets/images/off.png">



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
import 'package:lite_switch/lite_switch.dart';
Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 0),
              child: LiteSwitch(
                initValue: true,
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

                },
              ),
            ),
          ],
        ),
      ),
    );
 }
```
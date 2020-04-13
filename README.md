# Lite Switch

Lite Switch is a customized switch which you can add text and icon for "On" and "Off".
You can also set the width and height for you app.

## Screenshot
https://github.com/galacticpuffin/lite_switch/assets/images/on.png
https://github.com/galacticpuffin/lite_switch/assets/images/off.png


## Usage

To use this plugin :
Add the dependency to your pubspec.yaml file.
  dependencies:
    flutter:
      sdk: flutter
      lite_switch:

## Example
import 'package:lite_switch/lite_switch.dart';
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


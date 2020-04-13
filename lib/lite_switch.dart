library lite_switch;

import 'package:flutter/material.dart';
import 'dart:ui';


class liteswitch extends StatefulWidget {
  @required
  final bool value;
  @required
  final Function(bool) onChanged;
  final double iWidth;
  final double iHeight;
  final String textOff;
  final String textOn;
  final Color colorOn;
  final Color colorOff;
  final double textSize;
  final Duration animationDuration;
  final IconData iconOn;
  final IconData iconOff;
  final Function onTap;
  final Function onDoubleTap;
  final Function onSwipe;

  liteswitch(
      {this.value = false,
      this.iWidth = 140,
      this.iHeight = 40,
      this.textOff = "Sound Off",
      this.textOn = "Sound On",
      this.textSize = 16.0,
      this.colorOn = Colors.deepOrange,
      this.colorOff = Colors.black,
      this.iconOff = Icons.volume_off,
      this.iconOn = Icons.volume_up,
      this.animationDuration = const Duration(milliseconds: 600),
      this.onTap,
      this.onDoubleTap,
      this.onSwipe,
      this.onChanged});

  @override
  _LiteSwitchState createState() => _LiteSwitchState();
}

class _LiteSwitchState extends State<liteswitch>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;
  double value = 0.0;
  double get offsetvalue {
    if (value < 0.5) return -1;
    return 1;
  }

  bool turnState;

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this,
        lowerBound: 0.0,
        upperBound: 1.0,
        duration: widget.animationDuration);
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut);
    animationController.addListener(() {
      setState(() {
        value = animation.value;
      });
    });
    turnState = widget.value;
    _determine();
  }

  @override
  Widget build(BuildContext context) {
    Color transitionColor = Color.lerp(widget.colorOff, widget.colorOn, value);

    return GestureDetector(
      onDoubleTap: () {
        _action();
        if (widget.onDoubleTap != null) widget.onDoubleTap();
      },
      onTap: () {
        _action();
        if (widget.onTap != null) widget.onTap();
      },
      onPanEnd: (details) {
        _action();
        if (widget.onSwipe != null) widget.onSwipe();
        //widget.onSwipe();
      },
      child: Container(
        padding: EdgeInsets.all(5),
        width: widget.iWidth,
        height: widget.iHeight,
        decoration: BoxDecoration(
            color: transitionColor, borderRadius: BorderRadius.circular(40)),
        child: Stack(
          children: <Widget>[
            Transform.translate(
              offset: Offset(10 * value, 0),
              child: Opacity(
                opacity: (1 - value).clamp(0.0, 1.0).toDouble(),
                child: Container(
                  padding: EdgeInsets.only(right: 10),
                  alignment: Alignment.centerRight,
//                  width: widget.iWidth,
//                  height: widget.iHeight,
                  child: Text(
                    widget.textOff,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: widget.textSize),
                  ),
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(10 * (1 - value), 0),
              child: Opacity(
                opacity: value.clamp(0.0, 1.0).toDouble(),
                child: Container(
                  padding: EdgeInsets.only(left: 5),
                  alignment: Alignment.centerLeft,
//                  width: widget.iWidth,
//                  height: widget.iHeight,
                  child: Text(
                    widget.textOn,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: widget.textSize),
                  ),
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(
                  (widget.iWidth / 2 - widget.iHeight / 2) * offsetvalue, 0),
              child: Container(
//                width: widget.iWidth,
//                height: widget.iHeight,
                alignment: Alignment.center,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: Opacity(
                        opacity: (1.0 - value).clamp(0.0, 1.0).toDouble(),
                        child: Icon(
                          widget.iconOff,
                          size: widget.iHeight / 2,
                          color: transitionColor,
                        ),
                      ),
                    ),
                    Center(
                        child: Opacity(
                            opacity: value.clamp(0.0, 1.0).toDouble(),
                            child: Icon(
                              widget.iconOn,
                              size: widget.iHeight / 2,
                              color: transitionColor,
                            ))),
                  ],
                ),
              ),
              //),
            )
          ],
        ),
      ),
    );
  }

  void _action() {
    _determine(changeState: true);
  }

  void _determine({bool changeState = false}) {
    setState(() {
      if (changeState) turnState = !turnState;
      (turnState)
          ? animationController.forward()
          : animationController.reverse();

    });
  }
}

// # example

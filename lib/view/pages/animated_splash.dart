import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../export.dart';

late Widget _home;
late Function _customFunction;
late String _imagePath;
late int _duration;
late AnimatedSplashType _runfor;

enum AnimatedSplashType { StaticDuration, BackgroundProcess }

Map<dynamic, Widget> _outputAndHome = {};

class AnimatedSplash extends StatefulWidget {
  AnimatedSplash(
      {Key? key,
      required String imagePath,
      required Widget home,
      Function? customFunction,
      required int duration,
      required AnimatedSplashType type,
      Map<dynamic, Widget>? outputAndHome})
      : super(key: key) {
    _home = home;
    _duration = duration;
    _imagePath = imagePath;
    _runfor = type;
  }

  @override
  _AnimatedSplashState createState() => _AnimatedSplashState();
}

class _AnimatedSplashState extends State<AnimatedSplash> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    if (_duration < 1000) _duration = 2000;
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 800));
    _animation = Tween(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _animationController, curve: Curves.ease));
    _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.reset();
  }

  navigator(home) {
    Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (BuildContext context) => home));
  }

  @override
  Widget build(BuildContext context) {
    _runfor == AnimatedSplashType.BackgroundProcess
        ? Future.delayed(Duration.zero).then((value) {
            var res = _customFunction();
            //print("$res+${_outputAndHome[res]}");
            Future.delayed(Duration(milliseconds: _duration)).then((value) {
              Navigator.of(context).pushReplacement(
                  CupertinoPageRoute(builder: (BuildContext context) => _outputAndHome[res]!));
            });
          })
        : Future.delayed(Duration(milliseconds: _duration)).then((value) {
            Navigator.of(context)
                .pushReplacement(CupertinoPageRoute(builder: (BuildContext context) => _home));
          });

    return Scaffold(
        backgroundColor: kbackgroundColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            40.heightBox,
            ScaleTransition(
                scale: _animation,
                child: SizedBox(child: Image.asset(_imagePath))).wFull(context),
          ],
        ));
  }
}

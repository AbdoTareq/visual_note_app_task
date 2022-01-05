import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class RoundedCornerButton extends StatelessWidget {
  const RoundedCornerButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.color,
  }) : super(key: key);

  final Function() onPressed;
  final Color? color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
            color: color ?? Colors.black,
            onPressed: onPressed,
            splashColor: Colors.blueGrey,
            height: Get.height * .065,
            child: child)
        .cornerRadius(15);
  }
}

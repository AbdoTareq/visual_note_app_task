import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../export.dart';

class RowTextIcon extends StatelessWidget {
  const RowTextIcon({
    Key? key,
    required this.text,
    required this.childIcon,
    this.textColor,
  }) : super(key: key);

  final String text;
  final Widget childIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        childIcon,
        6.widthBox,
        text.text.color(textColor ?? Theme.of(context).primaryColor).bold.xs.make()
      ],
    );
  }
}

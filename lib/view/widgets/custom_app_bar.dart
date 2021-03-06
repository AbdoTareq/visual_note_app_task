import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Theme.of(context).dividerColor,
      iconTheme: const IconThemeData(color: Colors.grey),
      centerTitle: false,
      titleSpacing: 0,
      title: title.tr.text.start.color(Theme.of(context).primaryColor).xl3.bold.make().p8(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}

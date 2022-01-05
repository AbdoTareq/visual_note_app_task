import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Theme.of(context).dividerColor,
      iconTheme: const IconThemeData(color: Colors.grey),
      centerTitle: false,
      titleSpacing: 0,
      title: 'Account Settings'.text.start.color(Theme.of(context).primaryColor).bold.make().p8(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}

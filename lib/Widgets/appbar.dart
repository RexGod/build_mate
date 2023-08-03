import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double appBarHeight;

  CustomAppBar({required this.appBarHeight});

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: appBarHeight,
      title: Center(
        child: Image.asset(
          'lib/assets/LogoAppBar.png',
          fit: BoxFit.contain,
          height: 80,
        ),
      ),
    );
  }
}

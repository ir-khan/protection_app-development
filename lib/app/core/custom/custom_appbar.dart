import 'package:flutter/material.dart';
import 'package:protection_app/app/core/custom/custom_text.dart';
import 'package:protection_app/app/core/navigation_helper/navigation_helper.dart';
import 'package:protection_app/app/core/theme/neon_icons.dart';

///Custom AppBar with close button and title
AppBar customAppBar(String title) => AppBar(
      toolbarHeight: 70,
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () => Navigation.ofPop(),
        icon: const Icon(
          NeonIcons.close,
          size: 20,
        ),
      ),
      title: customTextBarTitle(title),
    );

///Custom AppBar with only titlep
AppBar customAppBarBackButton(String title) => AppBar(
      toolbarHeight: 70,
      title: customTextBarTitle(title),
    );

///Custom AppBar with leading widget and title
AppBar customAppBarHome(Widget? leading, List<Widget> actions) => AppBar(
      toolbarHeight: 70,
      automaticallyImplyLeading: false,
      leading: leading,
      actions: actions,
    );

///Custom AppBar
AppBar customAppBarNone() => AppBar(
      automaticallyImplyLeading: false,
    );

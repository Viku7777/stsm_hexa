import 'package:flutter/material.dart';

nextscreen(BuildContext context, String screen) =>
    Navigator.of(context).pushNamed(screen);
nextscreenRemove(BuildContext context, String screen) =>
    Navigator.of(context).pushNamedAndRemoveUntil(
      screen,
      (route) => false,
    );

nextscreenwithargu(BuildContext context, String screen, dynamic argu) =>
    Navigator.of(context).pushNamed(screen, arguments: argu);
nextscreenRemovewithargu(BuildContext context, String screen, dynamic argu) =>
    Navigator.of(context)
        .pushNamedAndRemoveUntil(screen, (route) => false, arguments: argu);

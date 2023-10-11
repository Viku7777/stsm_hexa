

import 'package:flutter/material.dart';

nextscreen(BuildContext context,String screen)=>Navigator.of(context).pushNamed(screen);
nextscreenwithargu(BuildContext context,String screen,Map argu)=>Navigator.of(context).pushNamed(screen,arguments: argu as Map<String,dynamic>);
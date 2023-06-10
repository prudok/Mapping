import 'package:flutter/material.dart';

class Device {
  static double? height;
  static double? width;
  static String? orientationType;
  static String? deviceType;

  void init(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final appBar = AppBar();
    final appBarHeight = appBar.preferredSize.height;
    final statusBarHeight = mediaQueryData.padding.top;
    final bottomBarHeight = mediaQueryData.padding.bottom;

    height = mediaQueryData.size.height - appBarHeight - statusBarHeight - bottomBarHeight;
    width = mediaQueryData.size.width;

    orientationType = (mediaQueryData.orientation == Orientation.portrait) ? "Portrait" : "Landscape";
    deviceType = (orientationType == "Portrait" && width! < 600) ? "Mobile" : "Tablet";
  }
}
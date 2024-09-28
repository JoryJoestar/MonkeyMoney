import 'package:flutter/material.dart';

class TabIconData {
  TabIconData({
    this.iconData,
    this.index = 0,
    this.isSelected = false,
    this.animationController,
  });

  IconData? iconData;
  bool isSelected;
  int index;

  AnimationController? animationController;

  static List<TabIconData> tabIconsList = <TabIconData>[
    TabIconData(
      iconData: Icons.home,
      index: 0,
      isSelected: true,
      animationController: null,
    ),
    TabIconData(
      iconData: Icons.insights,
      index: 1,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      iconData: Icons.analytics,
      index: 2,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      iconData: Icons.settings,
      index: 3,
      isSelected: false,
      animationController: null,
    ),
  ];
}

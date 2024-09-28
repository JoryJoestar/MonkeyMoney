import 'package:flutter/material.dart';
import 'package:monkey_money/models/tabs.dart';
import 'package:monkey_money/widgets/bottombar.dart';
import 'theme.dart';

import 'package:monkey_money/views/home/home.dart';
import 'package:monkey_money/views/analytics/analytics.dart';
import 'package:monkey_money/views/insights/insights.dart';
import 'package:monkey_money/views/settings/settings.dart';

import 'package:monkey_money/views/record/record.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomeView(),
    );
  }
}

class MyHomeView extends StatefulWidget {
  const MyHomeView({super.key});

  @override
  State<MyHomeView> createState() => _MyHomeViewState();
}

class _MyHomeViewState extends State<MyHomeView> with TickerProviderStateMixin {
  AnimationController? animationController;

  List<TabIconData> tabIconsList = TabIconData.tabIconsList;

  Widget tabBody = Container(
    color: AppTheme.background,
  );

  @override
  void initState() {
    for (var tab in tabIconsList) {
      tab.isSelected = false;
    }
    tabIconsList[0].isSelected = true;

    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    tabBody = HomeView(animationController: animationController);
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: FutureBuilder<bool>(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            } else {
              return Stack(
                children: <Widget>[
                  tabBody,
                  bottomBar(),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  Widget bottomBar() {
    return Column(
      children: <Widget>[
        const Expanded(
          child: SizedBox(),
        ),
        SafeArea(
          // 使用 SafeArea 包裹底部导航栏
          child: BottomBarView(
            tabIconsList: tabIconsList,
            addClick: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      RecordView(animationController: animationController),
                ),
              );
            },
            changeIndex: (int index) {
              if (index == 0) {
                animationController?.reverse().then<dynamic>((data) {
                  if (!mounted) {
                    return;
                  }
                  setState(() {
                    tabBody =
                        HomeView(animationController: animationController);
                  });
                });
              } else if (index == 1) {
                animationController?.reverse().then<dynamic>((data) {
                  if (!mounted) {
                    return;
                  }
                  setState(() {
                    tabBody =
                        InsightsView(animationController: animationController);
                  });
                });
              } else if (index == 2) {
                animationController?.reverse().then<dynamic>((data) {
                  if (!mounted) {
                    return;
                  }
                  setState(() {
                    tabBody =
                        AnalyticsView(animationController: animationController);
                  });
                });
              } else if (index == 3) {
                animationController?.reverse().then<dynamic>((data) {
                  if (!mounted) {
                    return;
                  }
                  setState(() {
                    tabBody =
                        SettingsView(animationController: animationController);
                  });
                });
              }
            },
          ),
        ),
      ],
    );
  }
}

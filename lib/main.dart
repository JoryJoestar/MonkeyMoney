import 'package:flutter/material.dart';
import 'package:monkey_money/models/tabs.dart';
import 'package:monkey_money/widgets/bottombar.dart';
import 'theme.dart';

import 'package:monkey_money/views/record/record.dart';
import 'package:monkey_money/views/assets/assets.dart';
import 'package:monkey_money/views/insights/insights.dart';
import 'package:monkey_money/views/account/account.dart';

import 'package:monkey_money/views/add_record/add_record.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 关闭右上角的 debug 标签
      theme: ThemeData(
        scaffoldBackgroundColor: AppTheme.background, // 设置全局背景颜色
        appBarTheme: const AppBarTheme(
          backgroundColor: AppTheme.lightBackground, // 设置 AppBar 的背景颜色
        ),
      ),
      home: const MainView(),
    );
  }
}

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> with TickerProviderStateMixin {
  AnimationController? animationController;

  List<TabIconData> tabIconsList = TabIconData.tabIconsList;

  Widget tabBody = Container(
    color: AppTheme.black,
  );

  @override
  void initState() {
    for (var tab in tabIconsList) {
      tab.isSelected = false;
    }
    tabIconsList[0].isSelected = true;

    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    tabBody = RecordView(animationController: animationController);
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
                      AddRecordView(animationController: animationController),
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
                        RecordView(animationController: animationController);
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
                        AccountView(animationController: animationController);
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

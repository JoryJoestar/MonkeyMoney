import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:monkey_money/theme.dart';

class RecordView extends StatefulWidget {
  const RecordView({super.key, this.animationController});

  final AnimationController? animationController;

  @override
  RecordViewState createState() => RecordViewState();
}

class RecordViewState extends State<RecordView> with TickerProviderStateMixin {
  String selectedType = 'Day'; // 默认选择的类型
  late TabController _tabController; // TabController
  final FocusNode _buttonFocusNode = FocusNode(debugLabel: 'Menu Button');
  DateTime currentDate = DateTime.now(); // 当前日期
  int currentIndex = 3; // 当前选中的索引
  bool isSwiping = false; // 状态标志，防止多次切换

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 7, vsync: this); // 最多展示7个日期

    setState(() {
      _tabController.index = currentIndex;
    });
  }

  @override
  void dispose() {
    _buttonFocusNode.dispose();
    _tabController.dispose(); // 释放 TabController
    super.dispose();
  }

  List<Widget> _buildTabs() {
    List<Widget> tabs = [];
    DateTime currentDate = DateTime.now();
    for (int i = -3; i <= 3; i++) {
      DateTime date = currentDate.add(Duration(days: i));
      String dateString = DateFormat('MM/dd').format(date);
      String dayString = DateFormat('EEE').format(date); // 获取周几的缩写
      tabs.add(
        GestureDetector(
          onTap: () {
            setState(() {
              _tabController.index = i + 3; // 设置当前选中的 Tab
            });
          },
          child: SizedBox(
            width: 36,
            height: 36,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  dateString,
                  style: const TextStyle(
                    fontFamily: AppTheme.fontName,
                    fontSize: 10,
                  ),
                ),
                Text(
                  dayString,
                  style: const TextStyle(
                      fontFamily: AppTheme.fontName, fontSize: 8),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return tabs;
  }

  void _onHorizontalSwipe(DragUpdateDetails details) {
    if (!isSwiping) {
      // 检查是否正在滑动
      if (details.delta.dx > 0) {
        // 向右滑动
        if (_tabController.index > 0) {
          setState(() {
            _tabController.index--;
            isSwiping = true; // 设置为正在滑动
          });
        }
      } else if (details.delta.dx < 0) {
        // 向左滑动
        if (_tabController.index < 6) {
          setState(() {
            _tabController.index++;
            isSwiping = true; // 设置为正在滑动
          });
        }
      }
    }
  }

  void _onHorizontalSwipeEnd(DragEndDetails details) {
    // 手势结束时重置状态
    setState(() {
      isSwiping = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'R',
                style: AppTheme.appBarFirstText,
              ),
              TextSpan(
                text: 'ecord',
                style: AppTheme.appBarLastText,
              ),
            ],
          ),
        ),
        actions: [
          // 使用 MenuAnchor 使类型可点击
          MenuAnchor(
            builder: (BuildContext context, MenuController controller,
                Widget? child) {
              return TextButton(
                focusNode: _buttonFocusNode,
                onPressed: () {
                  if (controller.isOpen) {
                    controller.close();
                  } else {
                    controller.open();
                  }
                },
                style: TextButton.styleFrom(
                  foregroundColor: AppTheme.lightBlack,
                  backgroundColor: Colors.transparent, // 设置背景颜色
                  // 设置 hover 时的背景颜色
                  overlayColor: AppTheme.lightBlack.withOpacity(0.12),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Row(
                    children: [
                      Text(selectedType,
                          style: const TextStyle(
                            fontFamily: AppTheme.fontName,
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                            letterSpacing: 0.4,
                            color: AppTheme.lightBlack,
                          )), // 显示当前选择的类型
                      const Icon(
                        Icons.arrow_drop_down,
                        color: AppTheme.lightBlack,
                        size: 24,
                      ), // 下拉箭头图标
                    ],
                  ),
                ),
              );
            },
            menuChildren: [
              SizedBox(
                width: 80.0, // 设置整个菜单的宽度
                child: Column(
                  children: [
                    MenuItemButton(
                      onPressed: () {
                        setState(() {
                          selectedType = 'Day'; // 更新选择的类型
                        });
                      },
                      style: MenuItemButton.styleFrom(
                        backgroundColor: AppTheme.white,
                        textStyle: const TextStyle(
                          fontFamily: AppTheme.fontName,
                          fontSize: 16, // 设置文本大小
                          color: AppTheme.lightBlack, // 设置文本颜色
                        ),
                      ),
                      child: const Center(child: Text('Day')),
                    ),
                    MenuItemButton(
                      onPressed: () {
                        setState(() {
                          selectedType = 'Month'; // 更新选择的类型
                        });
                      },
                      style: MenuItemButton.styleFrom(
                        backgroundColor: AppTheme.white,
                        textStyle: const TextStyle(
                          fontFamily: AppTheme.fontName,
                          fontSize: 16, // 设置文本大小
                          color: AppTheme.lightBlack, // 设置文本颜色
                        ),
                      ),
                      child: const Center(child: Text('Month')),
                    ),
                    MenuItemButton(
                      onPressed: () {
                        setState(() {
                          selectedType = 'Year'; // 更新选择的类型
                        });
                      },
                      style: MenuItemButton.styleFrom(
                        backgroundColor: AppTheme.white,
                        textStyle: const TextStyle(
                          fontFamily: AppTheme.fontName,
                          fontSize: 16, // 设置文本大小
                          color: AppTheme.lightBlack, // 设置文本颜色
                        ),
                      ),
                      child: const Center(child: Text('Year')),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
      body: GestureDetector(
        onHorizontalDragUpdate: _onHorizontalSwipe,
        onHorizontalDragEnd: _onHorizontalSwipeEnd,
        child: Column(
          children: [
            Container(
              color: AppTheme.lightBackground, // 与 AppBar 背景颜色相同
              child: TabBar(
                controller: _tabController,
                tabs: _buildTabs(),
                indicator: BoxDecoration(
                  color: AppTheme.lightBlack, // 指示器的背景颜色
                  borderRadius: BorderRadius.circular(4.0), // 圆角
                ),
                labelPadding:
                    const EdgeInsets.symmetric(horizontal: 8.0), // 设置标签间距
                labelStyle: const TextStyle(color: AppTheme.white),
                unselectedLabelStyle:
                    const TextStyle(color: AppTheme.lightBlack),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: List.generate(7, (index) {
                  return Center(
                      child: Text(
                          'Content for ${DateTime.now().add(Duration(days: index - 3)).toLocal()}'));
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

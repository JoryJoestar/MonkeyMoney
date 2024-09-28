import 'package:flutter/material.dart';

class IconSelector extends StatefulWidget {
  // 修改为 StatefulWidget
  final Function(String) onIconSelected;

  const IconSelector({super.key, required this.onIconSelected});

  @override
  IconSelectorState createState() => IconSelectorState();
}

class IconSelectorState extends State<IconSelector> {
  late String selectedIconName; // 添加状态变量

  final List<Map<String, dynamic>> iconsData = [
    {'icon': Icons.home, 'name': 'home'},
    {'icon': Icons.local_hospital, 'name': 'hospital'},
    {'icon': Icons.business, 'name': 'business'},
    {'icon': Icons.shopping_cart, 'name': 'shopping_cart'},
    {'icon': Icons.fastfood, 'name': 'fastfood'},
    {'icon': Icons.point_of_sale, 'name': 'point_of_sale'},
    {'icon': Icons.money, 'name': 'money'},
    {'icon': Icons.receipt, 'name': 'receipt'},
    {'icon': Icons.shopping_basket, 'name': 'shopping_basket'},
    // 可以继续添加更多图标...
  ];

  @override
  void initState() {
    super.initState();
    selectedIconName = iconsData[0]['name']; // 默认选择第一个图标
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < (iconsData.length / 6).ceil(); i++)
          Row(
            children: iconsData.skip(i * 6).take(6).map((iconData) {
              return _buildIconButton(iconData['icon'], iconData['name']);
            }).toList(),
          ),
      ],
    );
  }

  Widget _buildIconButton(IconData icon, String iconName) {
    return SizedBox(
      width: 60,
      height: 60,
      child: IconButton(
        icon: Icon(icon),
        color: selectedIconName == iconName ? Colors.blue : null, // 选中时改变颜色
        onPressed: () {
          setState(() {
            selectedIconName = iconName; // 更新选中的图标
          });
          widget.onIconSelected(iconName); // 选择图标时调用回调
        },
      ),
    );
  }
}

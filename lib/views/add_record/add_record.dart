// lib/views/record/record.dart
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // 引入 Provider
import 'package:monkey_money/models/record.dart'; // 引入 AddRecord 模型
import 'package:monkey_money/providers/record.dart'; // 引入 AddRecordProvider
import 'package:monkey_money/widgets/record/custom_keyboard.dart'; // 引入自定义数字键盘
import 'package:monkey_money/widgets/record/icons.dart'; // 引入图标选择组件

class AddRecordView extends StatefulWidget {
  const AddRecordView({super.key, this.animationController});
  final AnimationController? animationController;

  @override
  AddRecordViewState createState() => AddRecordViewState();
}

class AddRecordViewState extends State<AddRecordView> {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  String selectedIcon = 'home'; // 默认选择的图标
  double totalInputAmount = 0.0; // 新增变量，用于累计用户输入的金额
  List<double> recordList = []; // 新增变量，用于记录每个 + 分割的金额

  void _onNumberPressed(String number) {
    final String inputText = amountController.text;

    // 检查当前输入是否包含加号，并且小数部分是否已达到两位
    if (inputText.contains('+')) {
      // 只判断加号后面的部分
      final String lastPart = inputText.split(' + ').last;
      if (lastPart.contains('.') && lastPart.split('.').last.length >= 2) {
        return; // 如果小数部分已达到两位，返回不做任何操作
      }
    } else {
      // 检查整体输入
      if (inputText.contains('.') && inputText.split('.').last.length >= 2) {
        return; // 如果小数部分已达到两位，返回不做任何操作
      }
    }

    amountController.text += number; // 将点击的数字添加到金额输入框
  }

  void _onDotPressed() {
    final String inputText = amountController.text;

    // 检查当前输入是否包含数字部分，并且最后一个字符不是点号
    if (inputText.isNotEmpty &&
        !inputText.endsWith('.') &&
        !inputText.split(' + ').last.contains('.')) {
      amountController.text += '.'; // 添加点号
    }
  }

  void _onClearPressed() {
    amountController.clear(); // 清空金额输入框
    setState(() {
      totalInputAmount = 0; // 清空累计金额
    });
  }

  void _onBackspacePressed() {
    if (amountController.text.isNotEmpty) {
      if (amountController.text.endsWith(' + ')) {
        // 获取 recordList 中最后一个有效的金额
        amountController.text = amountController.text
            .substring(0, amountController.text.length - 3); // 删除最后的 " + "
        final double lastAmount = recordList.isNotEmpty ? recordList.last : 0.0;
        setState(() {
          totalInputAmount -= lastAmount; // 减去上次的金额
          recordList.removeLast(); // 从记录列表中移除最后一个金额
        });
      } else {
        amountController.text = amountController.text
            .substring(0, amountController.text.length - 1); // 删除最后一个字符
      }
    }
  }

  void _onSumAddRecord() {
    // 获取当前金额，切割字符串以获取加号前的数字
    final String inputText = amountController.text;
    final List<String> parts = inputText.split(' + '); // 切割字符串

    // 获取最后一个有效的金额
    final double currentAmount = double.tryParse(parts.last) ?? 0.0;
    final double formattedAmount =
        double.parse(currentAmount.toStringAsFixed(2)); // 限制为两位小数

    // 检查加号后是否有数字
    if (formattedAmount > 0) {
      // 更新累计金额
      setState(() {
        totalInputAmount += formattedAmount; // 累加当前输入的金额
        recordList.add(formattedAmount); // 将当前金额添加到记录列表
      });
      // 更新金额输入框为当前金额
      amountController.text += ' + '; // 显示累计金额并添加加号
    }
  }

  void _onComplete() {
    // 获取输入的金额和描述
    final double amount = double.tryParse(amountController.text) ?? 0.0;
    final String description = descriptionController.text;

    // 创建新的 AddRecord 实例
    final newAddRecord = Record(
      id: DateTime.now().toString(), // 使用当前时间戳作为 ID
      money: amount,
      desc: description,
      dateTime: DateTime.now(),
      type: RecordType.income, // 根据需要设置类型
      icon: selectedIcon, // 使用选择的图标
    );

    // 将记录添加到数据库
    Provider.of<RecordProvider>(context, listen: false).addRecord(newAddRecord);

    // 清空金额输入框
    amountController.clear(); // 清空金额输入框

    // 返回到上一页
    Navigator.pop(context);
  }

  void _onNewAddRecord() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Record'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        // 添加 Padding 小部件
        padding: const EdgeInsets.symmetric(horizontal: 24), // 设置左右边距为 24
        child: Stack(
          children: [
            Column(
              children: [
                // 图标选择器
                IconSelector(
                  onIconSelected: (iconName) {
                    setState(() {
                      selectedIcon = iconName; // 更新选择的图标
                    });
                  },
                ),
                const SizedBox(height: 20), // 增加间距
                // 其他内容可以放在这里
                Expanded(child: Container()), // 占位以推送 CustomKeyboard 到底部
              ],
            ),
            Positioned(
              bottom: 16, // 增加底部安全距离
              left: 0,
              right: 0,
              child: CustomKeyboard(
                onNumberPressed: _onNumberPressed,
                onDotPressed: _onDotPressed,
                onClearPressed: _onClearPressed,
                onBackspacePressed: _onBackspacePressed, // 传递回退功能
                onComplete: _onComplete, // 传递添加按钮的回调
                onNewRecord: _onNewAddRecord,
                onSumRecord: _onSumAddRecord,
                amountController: amountController, // 传递金额控制器
                descriptionController: descriptionController, // 传递描述控制器
                totalInputAmount: totalInputAmount, // 传递累计金额
              ),
            ),
          ],
        ),
      ),
    );
  }
}

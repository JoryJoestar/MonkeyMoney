import 'package:flutter/material.dart';

class CustomKeyboard extends StatelessWidget {
  final Function(String) onNumberPressed;
  final Function() onDotPressed;
  final Function() onClearPressed;
  final Function() onBackspacePressed; // 添加回退功能
  final Function() onComplete; // 添加按钮的回调
  final Function() onNewRecord;
  final Function() onSumRecord;
  final TextEditingController amountController; // 金额输入框控制器
  final TextEditingController descriptionController; // 描述输入框控制器
  final double totalInputAmount; // 累计金额

  const CustomKeyboard({
    super.key,
    required this.onNumberPressed,
    required this.onDotPressed,
    required this.onClearPressed,
    required this.onBackspacePressed, // 添加回退功能参数
    required this.onComplete, // 添加按钮的回调
    required this.onNewRecord,
    required this.onSumRecord,
    required this.amountController, // 金额输入框控制器
    required this.descriptionController, // 描述输入框控制器
    required this.totalInputAmount, // 累计金额
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 描述输入框
        TextField(
          controller: descriptionController,
          decoration: const InputDecoration(
            labelText: '描述',
            border: OutlineInputBorder(), // 添加边框
          ),
        ),
        const SizedBox(height: 10), // 增加描述与金额输入框之间的间距

        // 显示累计金额
        Text(
          '累计金额: $totalInputAmount', // 显示累计金额
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5), // 增加累计金额与键盘之间的间距

        // 金额输入框
        TextField(
          controller: amountController,
          decoration: const InputDecoration(
            labelText: '金额',
            border: OutlineInputBorder(), // 添加边框
          ),
          readOnly: true, // 设置为只读，防止用户直接输入
        ),
        const SizedBox(height: 20), // 增加金额输入框与键盘之间的间距

        // 数字键盘
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ...['1', '2', '3'].map((number) {
              return _buildNumberButton(number);
            }),
            ElevatedButton(
              onPressed: onBackspacePressed, // 回退按钮
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(80, 50), // 设置按钮最小宽度和高度
              ),
              child: const Icon(Icons.backspace), // 使用图标表示回退
            ),
          ],
        ),
        const SizedBox(height: 10), // 添加空行以增加间距
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ...['4', '5', '6'].map((number) {
              return _buildNumberButton(number);
            }),
            ElevatedButton(
              onPressed: onSumRecord, // 添加按钮
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(80, 50), // 设置按钮最小宽度和高度
              ),
              child: const Icon(Icons.add), // 使用图标表示回退
            ),
          ],
        ),
        const SizedBox(height: 10), // 添加空行以增加间距
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ...['7', '8', '9'].map((number) {
              return _buildNumberButton(number);
            }),
            ElevatedButton(
              onPressed: () {
                onDotPressed(); // 添加小数点按钮
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(80, 50), // 设置按钮最小宽度和高度
              ),
              child: const Icon(
                Icons.circle,
                size: 8.0,
              ), // 小数点按钮文本
            ),
          ],
        ),
        const SizedBox(height: 10), // 添加空行以增加间距
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: onClearPressed,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(80, 50), // 设置按钮最小宽度和高度
              ),
              child: const Icon(Icons.delete_forever),
            ),
            _buildNumberButton('0'),
            ElevatedButton(
                onPressed: onNewRecord, // 添加按钮
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(80, 50), // 设置按钮最小宽度和高度
                ),
                child: const Icon(Icons.arrow_right_alt)),
            ElevatedButton(
              onPressed: onComplete, // 添加按钮
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(80, 50), // 设置按钮最小宽度和高度
              ),
              child: const Icon(Icons.done), // 使用图标表示回退
            ),
          ],
        ),
      ],
    );
  }

  ElevatedButton _buildNumberButton(String number) {
    return ElevatedButton(
      onPressed: () {
        onNumberPressed(number);
      },
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(80, 50), // 设置按钮最小宽度和高度
      ),
      child: Text(number),
    );
  }
}

// lib/providers/record_provider.dart

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:monkey_money/models/record.dart';

class RecordProvider with ChangeNotifier {
  final String _boxName = 'recordsBox'; // Hive 数据库名称

  List<Record> incomeList = [];
  List<Record> expenceList = [];

  Future<void> init() async {
    await Hive.openBox<Record>(_boxName); // 打开 Hive 数据库
  }

  List<Record> get records {
    final box = Hive.box<Record>(_boxName);
    return box.values.toList(); // 获取所有记录
  }

  void addRecord(Record record) {
    final box = Hive.box<Record>(_boxName);
    box.add(record); // 添加记录
    notifyListeners(); // 通知监听者
  }

  void deleteRecord(String id) {
    final box = Hive.box<Record>(_boxName);
    box.delete((record) => record.id == id); // 根据 ID 删除记录
    notifyListeners(); // 通知监听者
  }

  void updateRecord(String id, Record updatedRecord) {
    final box = Hive.box<Record>(_boxName);
    final index =
        box.values.toList().indexWhere((record) => record.id == id); // 查找记录索引
    if (index != -1) {
      box.putAt(index, updatedRecord); // 更新记录
      notifyListeners(); // 通知监听者
    }
  }
}

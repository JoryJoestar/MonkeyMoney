// lib/models/record.dart

import 'package:hive_flutter/hive_flutter.dart';

part 'record.g.dart'; // 确保这一行存在

@HiveType(typeId: 0)
enum RecordType {
  @HiveField(0)
  income,
  @HiveField(1)
  expense
}

@HiveType(typeId: 1)
class Record {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final double money;

  @HiveField(2)
  final String desc;

  @HiveField(3)
  final DateTime dateTime;

  @HiveField(4)
  final RecordType type;

  @HiveField(5)
  final String icon;

  Record({
    required this.id,
    required this.money,
    required this.desc,
    required this.dateTime,
    required this.type,
    required this.icon,
  });
}

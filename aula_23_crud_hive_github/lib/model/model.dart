// 12
import 'package:hive/hive.dart';

part "model.g.dart";

@HiveType(typeId: 1)
// 12

class Data {
  // 12
  @HiveField(0)
  // 12
  String title;
  // 12
  @HiveField(1)
  // 12
  String description;

  Data({
    required this.title,
    required this.description,
  });
}

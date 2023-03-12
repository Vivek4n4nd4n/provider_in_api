import 'package:flutter/gestures.dart';
import 'package:provider/provider.dart';
class Todo{
  final int id;
  final int userId;
final String title;
bool completed;

Todo({
  required this.id,
  required this.userId,
  required this.title,
  required this.completed,
});
}
import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color color;
  final List<String> k;


const  Category({
  @required this.id,
  @required this.title,
  @required this.color = Colors.orange,
  @required this.k});
}

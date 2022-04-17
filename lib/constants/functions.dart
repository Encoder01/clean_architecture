import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void showSnackBar(context,text){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text),duration: const Duration(seconds: 1),));
}
 
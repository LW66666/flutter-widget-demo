import 'package:flutter/material.dart';

void main() => runApp(StatelessWidgetDemo());

// 无状态的 widget
class StatelessWidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '没有状态的Widget',
      home: Scaffold(
          appBar: AppBar(
            title: Text('没有setState 方法'),
          ),
          body: Center(
            child: Text(
              '不能存储状态，不能修改状态',
            ),
          )),
    );
  }
}

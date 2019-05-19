import 'package:flutter/material.dart';

void main() => runApp(StatefulWidgetDemo());

class StatefulWidgetDemo extends StatefulWidget {
  // 创建状态
  @override
  _StatefulWidgetDemoState createState() => _StatefulWidgetDemoState();
}

// 创建 StatefulWidgetDemo 的状态
class _StatefulWidgetDemoState extends State<StatefulWidgetDemo> {
  // 提供了 setState 方法实时更行页面显示
  int _count = 0;

  // 没有返回值得方法增加 count
  void _addCount() {
    setState(() {
      _count++;
    });
  }

  // 没有返回值得方法减少 count
  void _reduceCount() {
    setState(() {
      _count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('这是一个可以存储状态的 widget count: $_count'),
      ),
      body: Center(
        child: Row(
          children: <Widget>[
            RaisedButton(
              child: Text('增加'),
              onPressed: _addCount,
              color: Colors.blue,
              shape: StadiumBorder(
                  side: BorderSide(
                      color: Color.fromRGBO(255, 222, 66, 1.0), width: 5)),
            ),
            RaisedButton(
              child: Text('减少'),
              onPressed: _reduceCount,
              color: Colors.deepOrangeAccent,
              shape: StadiumBorder(
                  side: BorderSide(
                      color: Color.fromRGBO(255, 222, 66, 1.0), width: 5)),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    ));
  }
}

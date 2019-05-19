import 'package:flutter/material.dart';

void main() => runApp(RowDemo());

///
///   row 的配置项
///  {
///     Key key,
///     MainAxisAlignment mainAxisAlignment: MainAxisAlignment.start,
///       配置沿主轴如何放置子项, 和flex类似
///         - center, end, spaceAround, spaceBetween,s paceEvenly, start
///
///     MainAxisSize mainAxisSize: MainAxisSize.max,
///       主轴应该占据的空间：final
///         - max, min
///
///     CrossAxisAlignment crossAxisAlignment: CrossAxisAlignment.center,
///       在flex布局中如何沿横轴放置子项
///         - center, start, end, stretch(要求子对象填充横轴。), baseline
///
///     TextDirection textDirection,
///       文本流动的方向。
///         - rtl: 右到左
///         - ltr: 左到右
///
///     VerticalDirection verticalDirection: VerticalDirection.down,
///       盒子垂直流动的方向。
///         - up: 从上面开始堆
///         - down: 从下面开始堆
///
///     TextBaseline textBaseline,
///       用于对齐文本的水平线
///         - alphabetic: 用于对齐字母字符底部的水平线
///         - ideographic: 用来对齐表意字符的水平线
///
///     List<Widget> children: const <Widget>[]
///       子Widget列表
///   }
///
///   常用搭配组件
///    Expanded()  灵活占位的组件
///
class RowDemo extends StatelessWidget {
  static BoxConstraints boxConstraints = BoxConstraints(
    maxHeight: 90.0,
    minHeight: 40.0,
    maxWidth: 90.0,
    minWidth: 40.0,
  );

  // 颜色列表
  static List<Color> rowColors = [
    Colors.deepOrangeAccent,
    Colors.blueAccent,
    Colors.green,
  ];

  // 非展开的 row
  static List<Widget> rowWidget = List.generate(3, (index) {
    return Container(
      child: Text('Row $index'),
//      constraints: boxConstraints,
      color: rowColors[index],
      alignment: Alignment.center,
      height: 30.0 * (index + 1),
      width: 30.0 * (index + 1),
    );
  });

  // 灵活展开的 row
  static List<Widget> rowWidgetExpanded = List.generate(3, (index) {
    return Expanded(
      child: Container(
        child: Text('Expanded Row $index'),
        alignment: Alignment.center,
        color: rowColors[index],
        height: 25.0 * (index + 1),
      ),
      flex: 1,
    );
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('row 常用属性例子')),
        body: ListView(
          children: <Widget>[
            Text('水平垂直居中的 row'),
            Row(
              children: rowWidget,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
            ),
            Text('水平垂直居中灵活展开的 row'),
            Row(
              children: rowWidgetExpanded,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
            ),
            Text('水平向左垂直向上的 row'),
            Row(
              children: rowWidget,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
            Text('根据字符线对齐的 row'),
            Row(
              children: rowWidgetExpanded,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.ideographic,
            ),
            Text('从右向左展示的 row'),
            Row(
              children: rowWidgetExpanded,
              textDirection: TextDirection.rtl,
            ),
            Text('主轴扩展整行 MainAxisSize.max 的 row'),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                color: Colors.deepPurpleAccent,
                child: Row(
                  children: rowWidget,
                  mainAxisSize: MainAxisSize.max,
                ),
              ),
            ),
            Text('主轴不扩展整行 MainAxisSize.min 的 row'),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                color: Colors.deepPurpleAccent,
                child: Row(
                  children: rowWidget,
                  mainAxisSize: MainAxisSize.min,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

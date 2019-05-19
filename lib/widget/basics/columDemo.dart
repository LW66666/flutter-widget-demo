import 'package:flutter/material.dart';

void main() => runApp(ColumnDemo());

///
///   Column 的配置项
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
class ColumnDemo extends StatelessWidget {
  static BoxConstraints boxConstraints = BoxConstraints(
    maxHeight: 90.0,
    minHeight: 40.0,
    maxWidth: 90.0,
    minWidth: 40.0,
  );

  // 颜色列表
  static List<Color> columnColors = [
    Colors.deepOrangeAccent,
    Colors.blueAccent,
    Colors.green,
  ];

  // 非展开的 Column
  static List<Widget> columnWidget = List.generate(3, (index) {
    return Container(
      child: Text('Column $index'),
      color: columnColors[index],
      alignment: Alignment.center,
      height: 30.0 * (index + 1),
      width: 30.0 * (index + 1),
    );
  });

  // 灵活展开的 Column
  static List<Widget> columnWidgetExpanded = List.generate(3, (index) {
    return Expanded(
      child: Container(
        child: Text('Expanded Column $index'),
        alignment: Alignment.center,
        color: columnColors[index],
        height: 25.0 * (index + 1),
      ),
      flex: 1,
    );
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Column 常用属性例子')),
        body: GridView.count(
          crossAxisCount: 3,
          childAspectRatio: .2,
          children: <Widget>[
            Tooltip(
              message: 'sdafffffffffffffffffffffffffffffffffffffffffffffff',
              child: Column(
                children: List.castFrom(columnWidgetExpanded),
              ),
            ),
            ListView(
              children: <Widget>[
                Text('展开的 Column'),
                Column(
                  children: columnWidget,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

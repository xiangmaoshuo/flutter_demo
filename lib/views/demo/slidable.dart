import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidableDemo extends StatefulWidget {
  @override
  State<SlidableDemo> createState() {
    return new _SlidableDemoState();
  }
}

class _SlidableDemoState extends State<SlidableDemo> {
  final Divider _divider = Divider(height: 6.0, color: Colors.transparent);
  final _actions = <Widget>[
    new IconSlideAction(
      caption: 'Archive',
      color: Colors.blue,
      icon: Icons.archive,
    ),
    new IconSlideAction(
      caption: 'Share',
      color: Colors.indigo,
      icon: Icons.share,
    ),
  ];
  final _secondaryActions = <Widget>[
    new IconSlideAction(
      caption: 'More',
      color: Colors.black45,
      icon: Icons.more_horiz,
    ),
    new IconSlideAction(
      caption: 'Delete',
      color: Colors.red,
      icon: Icons.delete,
      onTap: () {
        print('onTap');
        return true;
      },
    ),
  ];
  final SlidableController _controller = SlidableController();

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);
    return Material(
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return _divider;
        },
        itemCount: 30,
        itemBuilder: (context, index) {
          return Slidable(
            controller: _controller,
            delegate: SlidableDrawerDelegate(),
            actionExtentRatio: 0.2,
            child: CustomPaint(
              painter: _BgPainer(),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: _themeData.primaryColor,
                  child: Text('${index + 1}'),
                  foregroundColor: _themeData.primaryTextTheme.body2.color,
                ),
                title: Text('Tile for ${index + 1}'),
                subtitle: Text('SubTitle for ${index + 1}'),
              ),
            ),
            actions: _actions,
            secondaryActions: _secondaryActions,
          );
        }
      ),
    );
  }
}

class _BgPainer extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    // 绘制背景（白色）
    Paint paint = Paint()
    ..isAntiAlias = true
    ..style = PaintingStyle.fill
    ..color = Colors.white;
    canvas.drawRect(Offset.zero & size, paint);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
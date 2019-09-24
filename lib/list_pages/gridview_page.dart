import 'package:flutter/material.dart';

class GridViewPage extends StatefulWidget {
  final String title;

  const GridViewPage(this.title, {Key key}) : super(key: key);

  @override
  _GridViewPageState createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {
  var lists = <String>['A', 'S', 'D', 'F', 'G', 'h', 'j', 'k', 'l'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: GridView.count(
          //列数
          crossAxisCount: 2,
          //长宽比例
          childAspectRatio: 1,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          children: _listWidgets(),
        ));
  }

  List<Widget> _listWidgets() {
    return lists.map((item) {
      return _item(item);
    }).toList();
  }

  Widget _item(String item) {
    return Container(
      decoration: BoxDecoration(color: Colors.blue),
      alignment: AlignmentDirectional.center,
      child: Text(
        item,
        style: TextStyle(color: Colors.white, fontSize: 22),
      ),
    );
  }
}

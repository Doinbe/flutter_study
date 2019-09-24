import 'package:flutter/material.dart';

class ExpansionListPage extends StatefulWidget {
  final String title;

  const ExpansionListPage(this.title, {Key key}) : super(key: key);

  @override
  _ExpansionListPageState createState() => _ExpansionListPageState();
}

class _ExpansionListPageState extends State<ExpansionListPage> {
  var maps = {
    'a': [1, 2, 3, 4, 5],
    'b': [11, 22, 33, 44, 55],
    'c': [12, 23, 34, 45, 56],
    'd': [13, 25, 37, 48, 59],
    'e': [15, 25, 35, 45, 55],
    'f': [12, 22, 32, 42, 52],
    'g': [13, 23, 33, 43, 53],
    'h': [14, 24, 34, 44, 54],
    'm': [10, 20, 30, 40, 50],
  };

  IconData _icon = Icons.airplanemode_active;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: _buildItems(),
      ),
    );
  }

  List<Widget> _buildItems() {
    return maps.keys.map((key) {
      return _buildItem(key, maps[key]);
    }).toList();
  }

  Widget _buildItem(String key, List<int> map) {
    return ExpansionTile(
      title: Text(key),
      backgroundColor: Colors.green,
      leading: Icon(Icons.folder),
      trailing: Icon(_icon),
      onExpansionChanged: (bool) {
        setState(() {
          if (bool)
            _icon = Icons.airplanemode_active;
          else
            _icon = Icons.airplanemode_inactive;
        });
      },
      children: _buildSubItems(map),
    );
  }

  List<Widget> _buildSubItems(List<int> map) {
    return map.map((value) {
      return Container(
        decoration: BoxDecoration(color: Colors.amber),
        child: ListTile(
          title: Text(value.toString()),
        ),
      );
    }).toList();
  }
}

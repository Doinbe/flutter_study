import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  final String title;

  const ListViewPage(this.title,{Key key}) : super(key: key);
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  var lists = <String>['A','S','D','F','G','h','j','k','l'];
  var _scrollDirection = Axis.vertical;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('切换'),
          onPressed: (){
        setState(() {
          if(_scrollDirection == Axis.horizontal){
            _scrollDirection = Axis.vertical;
          } else{
            _scrollDirection = Axis.horizontal;
          }
        });
      }),
      body: ListView(
        scrollDirection: _scrollDirection,
        children: _listWidgets(),
      ),
    );
  }

  List<Widget> _listWidgets(){
    return lists.map((item){
       return _item(item);
    }).toList();
  }

  Widget _item(String item) {
    return Container(
      width: 100,
      height: 100,
      margin: EdgeInsets.only(bottom:5,right: 5),
      decoration: BoxDecoration(color: Colors.blue),
      alignment: AlignmentDirectional.center,
      child: Text(item,style: TextStyle(color: Colors.white,fontSize: 22),),
    ) ;
  }

}

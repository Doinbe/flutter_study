import 'package:flutter/material.dart';
import 'package:flutter_study/list_pages/expansion_list_page.dart';
import 'package:flutter_study/list_pages/gridview_page.dart';
import 'package:flutter_study/list_pages/listview_page.dart';
import 'package:flutter_study/list_pages/listview_refresh_page.dart';

class ListPage extends StatelessWidget {
  final String title;
  const ListPage(this.title,{Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text('ListView水平或垂直列表'),
              onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return ListViewPage('ListView水平或垂直列表');
            }));
          }),
          RaisedButton(
              child: Text('GridView网格列表'),
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return GridViewPage('GridView网格列表');
                }));
              }),
          RaisedButton(
              child: Text('ExpansionTile可展开列表'),
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return ExpansionListPage('ExpansionTile可展开列表');
                }));
              }),
          RaisedButton(
              child: Text('列表下拉刷新，底部加载更多'),
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return ListViewRefreshPage('列表下拉刷新，底部加载更多');
                }));
              }),
        ],
      ),
    );
  }
}

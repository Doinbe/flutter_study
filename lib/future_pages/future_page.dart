import 'package:flutter/material.dart';
import 'package:flutter_study/future_pages/async_await_page.dart';
import 'package:flutter_study/future_pages/future_then_page.dart';
import 'package:flutter_study/future_pages/future_timeout_page.dart';
import 'package:flutter_study/future_pages/future_whencomplete_page.dart';
import 'package:flutter_study/future_pages/futurebuilder_page.dart';

class FuturePage extends StatelessWidget {
  final String title;

  const FuturePage(this.title, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: Text('Future 表示在接下来某个时间的值或错误，借助Future我们可以在Future实现异步操作。'),
          ),
          Padding(
              padding: EdgeInsets.all(10),
              child: Text('Future 的常见用法如下：'),
          ),
          RaisedButton(
            child: Text('Future.then 获取future的值与异常'),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return FutureThenPage('Future.then');
              }));
            },
          ),
          RaisedButton(
            child: Text('async await(异步转同步)'),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return AsyncAwaitPage('async await 异步函数');
              }));
            },
          ),
          RaisedButton(
            child: Text('Future.timeout'),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return FutureTimeOutPage('Future.timeout');
              }));
            },
          ),
          RaisedButton(
            child: Text('Future.whenComplete'),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return FutureWhenCompletePage('Future.whenComplete');
              }));
            },
          ),
          RaisedButton(
            child: Text('FutureBuilder'),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return FutureBuilderPage('FutureBuilder');
              }));
            },
          ),
        ],
      ),
    );
  }
}

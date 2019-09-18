import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesPage extends StatefulWidget {
  final String title;
  const SharedPreferencesPage(this.title,{Key key}) : super(key: key);
  @override
  _SharedPreferencesPageState createState() => _SharedPreferencesPageState();
}

class _SharedPreferencesPageState extends State<SharedPreferencesPage> {
  String _data = '';
  int _dataNum = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.all(10),
            child: Text('简单的，异步的，持久化的key-value储存系统。'
                '在Android上它是基于SharedPreferences；在IOS上它是基于NSUserDefaults'),
          ),
          RaisedButton(
              child: Text('add Data to SharedPreferences'),
              onPressed: (){
                test1();
              }),
          RaisedButton(
              child: Text('select SharedPreferences data'),
              onPressed: (){
                test2();
              }),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(_data),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(_dataNum.toString()),
          ),
        ],
      ),
    );
  }

  test1() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      _data = '1$_data';
    });
    int count = (preferences.getInt('counter')?? 0)+1;
    await preferences.setInt('counter', count);
  }

  test2() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      _dataNum = preferences.getInt('counter');
    });
  }



}

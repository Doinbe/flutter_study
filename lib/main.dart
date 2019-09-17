import 'package:flutter/material.dart';
import 'package:flutter_study/future_pages/future_page.dart';
import 'package:flutter_study/picker_image.dart';

import 'animation_pages/animation_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Study',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Study Home Page'),
      routes: <String, WidgetBuilder>{
        'pickerIameg': (BuildContext context) => PickerImagePage('获取图片'),
        'animation': (BuildContext context) => AnimationPage('Flutter动画'),
        'future': (BuildContext context) => FuturePage('Flutter异步'),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _isByName = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SwitchListTile(
                title: Text('${_isByName ? '' : '不'}通过路由名跳转'),
                value: _isByName, 
                onChanged: (value){
                  setState(() {
                    _isByName = value;
                  });
                }
                ),
            _itemWidget('原生(拍照，相册)图片获取', PickerImagePage('获取图片'), 'pickerIameg'),
            _itemWidget('Flutter动画', AnimationPage('Flutter动画'), 'animation'),
            _itemWidget('Flutter异步', FuturePage('Flutter异步'), 'future'),
          ],
        ),
      ),
    );
  }

  _itemWidget(String title, page, String routeName) {
    return Container(
      child: RaisedButton(
          child: Text(title),
          onPressed: () {
            if (_isByName) {
              Navigator.pushNamed(context, routeName);
            } else {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => page));
            }
          }),
    );
  }
}

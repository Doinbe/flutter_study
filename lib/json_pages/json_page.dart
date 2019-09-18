import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_study/json_pages/json_mdel.dart';

class JsonPage extends StatefulWidget {
  final String title;

  const JsonPage(this.title,{Key key}) : super(key: key);

  @override
  _JsonPageState createState() => _JsonPageState();
}

class _JsonPageState extends State<JsonPage> {
  String json =
      '{ "url": "xxx", "tabs": [ { "labelName": "推荐", "groupChannelCode": "tourphoto_global1" }, { "labelName": "拍照技巧", "groupChannelCode": "tab-photo" } ] }';
  JsonMdel _mdel = null;
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
            child: Text(
                'dart:convert 文档中提供了 jsonDecode()方法解析JSON字符串，不幸的是jsonDecode()方法返回的是一个Map<String,dynamic>，'
                '平常使用中不加方便，所以为了方便使用在创建Dart的实体类的时候，构造了一个fromJson(Map<String, dynamic>)的方法将map转换成dart实体'),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text('json数据量较多，为了高效率使用网上提供了三方插件，网页在线转换都是有的 jsonToDart...'),
          ),
          RaisedButton(
              child: Text('json转换dart实体'),
              onPressed: (){
                setState(() {
                  _mdel = jsonToDart();
                });
              }),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(json),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(_mdel != null ? '转换后的数据：url = ${_mdel.url};  '
                'tab1[labelName] = ${_mdel.tabs[0].labelName};  '
                'tab2[labelName] = ${_mdel.tabs[1].labelName};' : 'null'
            ),
          ),

        ],
      ),
    );
  }

  jsonToDart(){
    return JsonMdel.fromJson(jsonDecode(json));
  }

}

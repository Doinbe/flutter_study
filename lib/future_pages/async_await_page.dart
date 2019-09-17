import 'package:flutter/material.dart';

class AsyncAwaitPage extends StatefulWidget {
  final String title;

  const AsyncAwaitPage(this.title, {Key key}) : super(key: key);

  @override
  _AsyncAwaitPageState createState() => _AsyncAwaitPageState();
}

class _AsyncAwaitPageState extends State<AsyncAwaitPage> {
  var _result = 'null';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text('Dart 官网写到：1.使用async和await的代码是异步的。'),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text('Dart 官网写到：2.要使用await，其方法必须带有async关键字。'),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
                'Dart 官网写到：3.在方法上添加async关键字，则这个方法的返回值为Future，并且认为该函数是一个耗时操作。'),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
                'Dart 官网写到：4.添加async关键字的方法的函数体不需要使用Future API，Dart会自动在需要的时候创建Future对象'),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(_result),
          ),
          RaisedButton(
              child: Text('异步任务函数 test() 执行返回类型，验证 3 4 点'),
              onPressed: (){
                setState(() {
                  _result = test().runtimeType.toString();
                });
              }),
          RaisedButton(
              child: Text('异步任务函数 test() 执行返回结果'),
              onPressed: (){
                  test1().then((value){
                    setState(() {
                      _result = value;
                    });
                  }).catchError((error){
                    setState(() {
                      _result = error;
                    });
                  });
              }),
        ],
      ),
    );
  }

  /// 结合Dart 官网提出的 3 4 点，模拟一个异步任务,验证
  test() async{
    String result = await Future.delayed(Duration(seconds: 3),(){
      return Future.value('耗时3秒后的返回结果');
    });
    print(result);
  }


  Future<String> test1() async{
     return await Future.delayed(Duration(seconds: 3),() => Future.value('耗时3秒后的返回结果'));
  }
}

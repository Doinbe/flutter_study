import 'package:flutter/material.dart';

class FutureWhenCompletePage extends StatefulWidget {
  final String title;
  const FutureWhenCompletePage(this.title,{Key key}) : super(key: key);
  @override
  _FutureWhenCompletePageState createState() => _FutureWhenCompletePageState();
}

class _FutureWhenCompletePageState extends State<FutureWhenCompletePage> {
  var _result = 'null';
  var _complete = 'null';

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
            child: Text('有时需要Future结束的时候做一些操作，Future.then().catchError()的模式类似于try-cacth,try-catch有个finally代码块，而Future.whenComplete就是Future的finally'),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(_result),
          ),Padding(
            padding: EdgeInsets.all(10),
            child: Text(_complete),
          ),
          RaisedButton(
              child: Text('Future 执行成功，whenComplete的执行验证'),
              onPressed: (){
                Future.delayed(Duration(seconds: 2), () => Future.value('执行成功')).then((value){
                  setState(() {
                    _result = value;
                  });
                }).whenComplete(() => Future.value('执行成功 done!').then((value){
                  setState(() {
                    _complete = value;
                  });
                }));
              }),
          RaisedButton(
              child: Text('Future 执行失败，whenComplete的执行验证'),
              onPressed: (){
                Future.delayed(Duration(seconds: 2), () => Future.error('执行失败')).catchError((error){
                  setState(() {
                    _result = error;
                  });
                }).whenComplete(() => Future.value('执行失败 done!').then((value){
                  setState(() {
                    _complete = value;
                  });
                }));
              }),
        ],
      ),
    );
  }
}

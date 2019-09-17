import 'package:flutter/material.dart';

class FutureTimeOutPage extends StatefulWidget {
  final String title;

  const FutureTimeOutPage(this.title, {Key key}) : super(key: key);

  @override
  _FutureTimeOutPageState createState() => _FutureTimeOutPageState();
}

class _FutureTimeOutPageState extends State<FutureTimeOutPage> {
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
            padding: EdgeInsets.all(10),
            child: Text(
                '完成一个异步任务可能需要很长的时间，例如网络请求与网络状况，这时就需要为异步任务设置一个超时时间。就有Future.timeout()'),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(_result),
          ),
          RaisedButton(
              child: Text('异步超时任务'),
              onPressed: () {
                Future.delayed(Duration(seconds: 3), () => Future.value('执行成功'))
                    .then((value) {
                      setState(() {
                        _result = value;
                      });
                    })
                    .timeout(Duration(seconds: 2))
                    .catchError((e) {
                      setState(() {
                        _result = e.toString();
                      });
                    });
              }),
        ],
      ),
    );
  }
}

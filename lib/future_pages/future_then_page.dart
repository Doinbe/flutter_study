import 'package:flutter/material.dart';

class FutureThenPage extends StatefulWidget {
  final String title;
  const FutureThenPage(this.title,{Key key, }) : super(key: key);
  @override
  _FutureThenPageState createState() => _FutureThenPageState();
}

class _FutureThenPageState extends State<FutureThenPage> {

  String _result= 'null';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
                child: Text('模拟异步返回成功操作'),
                onPressed:(){
                  setState(() {
                    testFuture(true).then((value){
                      _result = value;
                    });
                  });
                }),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text('在源码then(FutureOr<R> onValue(T value), {Function onError),知道提供了一个onErroe 返回错误的函数体'),
            ),
            RaisedButton(
                child: Text('模拟异步返回失败操作'),
                onPressed:(){
                  setState(() {
                    testFuture(false).then((value){
                      print('===>执行成功onValue函数体');
                      _result = value;
                    }, onError: (e){
                      print('===>执行错误onError函数体');
                      _result = 'onError：$e';
                    });
                  });
                }),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text('在源码Future<R> then<R>()函数返回的是一个Future<R>，在Future中也提供了一个catchError(Function onError)返回错误的函数'),
            ),
            RaisedButton(
                child: Text('模拟异步返回失败操作'),
                onPressed:(){
                  setState(() {
                    testFuture(false).then((value){
                      print('===>执行成功onValue函数体');
                      _result = value;
                    }).catchError((e){
                      print('===>执行错误catchError函数体');
                      _result = 'catchError：$e';
                    });
                  });
                }),
            Padding(padding: EdgeInsets.only(top: 10)),
            RaisedButton(
                child: Text('Future.then(onError()) 和 Future.catchError() 都存在，模拟异步返回失败操作'),
                onPressed:(){
                  setState(() {
                    testFuture(false).then((value){
                      print('===>执行成功onValue函数体');
                      _result = value;
                    },onError: (e){
                      print('===>执行错误onError函数体');
                      _result = 'onError函数体：$e';
                    }).catchError((e){
                      print('===>执行错误catchError函数体');
                      _result = 'catchError函数体：$e';
                    });
                  });
                }),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text('Future.then(onError()) 和 Future.catchError() 都存在时，出现错误时，通过打印Log知道只会执行Future.then(onError())'),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(_result),
            )
          ],
        ),
      )

    );
  }

  Future<String> testFuture(bool isSuccess){
    return isSuccess ? Future.value('模拟异步任务 返回成功') : Future.error('模拟异步任务 返回失败');
  }

}

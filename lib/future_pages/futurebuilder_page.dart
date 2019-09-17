
import 'package:flutter/material.dart';

class FutureBuilderPage extends StatefulWidget {
  final String title;

  const FutureBuilderPage(this.title, {Key key}) : super(key: key);

  @override
  _FutureBuilderPageState createState() => _FutureBuilderPageState();
}

class _FutureBuilderPageState extends State<FutureBuilderPage> {
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
                'FutureBuilder是一个将异步操作和异步UI结合在一起的类，通过它可以将网络请求，数据库读取等的结果更新在页面上'),
          ),
          FutureBuilder(
            future: test(),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot){
              switch(snapshot.connectionState){
                case ConnectionState.none:
                  return Text('Future is null');
                case ConnectionState.waiting:
                  return CircularProgressIndicator();
                case ConnectionState.active:
                  return Text('null');
                case ConnectionState.done:
                  if(snapshot.hasError){
                    return Text('${snapshot.error}',style: TextStyle(color: Colors.red));
                  }else{
                    return Text('${snapshot.data}');
                  }
              }
          }),
        ],
      ),
    );
  }

  Future<String> test() async{
    String result = await Future.delayed(Duration(seconds: 3),() => Future.value('执行成功'));
    return result;
  }

}

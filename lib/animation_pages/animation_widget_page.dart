import 'package:flutter/material.dart';

class AnimationWidgetPage extends StatefulWidget {
  final String title;

  const AnimationWidgetPage(this.title, {Key key}) : super(key: key);

  @override
  _AnimationWidgetPageState createState() => _AnimationWidgetPageState();
}

class _AnimationWidgetPageState extends State<AnimationWidgetPage> with SingleTickerProviderStateMixin {
  Animation<Color> _animation;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration:  Duration(seconds: 2));
    _animation = ColorTween(begin: Colors.red, end: Colors.green).animate(_controller)
    ..addStatusListener((staue){
      ///通过状态的监听操作 呼吸灯的效果
      if(staue == AnimationStatus.completed){
        _controller.reverse();
      } else if(staue == AnimationStatus.dismissed){
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              RaisedButton(child: Text('开始'), onPressed: () {
                _controller.reset();
                _controller.forward();
              }),
              RaisedButton(child: Text('停止'), onPressed: () {
                _controller.stop();
              }),
              RaisedButton(child: Text('倒放'), onPressed: () {
                _controller.reverse();
              })
            ],
          ),
          AnimationView(animation: _animation)
        ],
      ),
    );
  }
}

class AnimationView extends AnimatedWidget {
  AnimationView({Key key, Animation<Color> animation}):super(key: key, listenable: animation);
  @override
  Widget build(BuildContext context) {
    final Animation<Color> _animation = listenable;
    return ClipOval(
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(color: _animation.value),
      ),
    );
  }
}

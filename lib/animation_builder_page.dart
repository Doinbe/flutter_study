import 'package:flutter/material.dart';

class AnimationBuilderPage extends StatefulWidget {
  final String title;

  const AnimationBuilderPage(this.title, {Key key}) : super(key: key);

  @override
  _AnimationBuilderPageState createState() => _AnimationBuilderPageState();
}

class _AnimationBuilderPageState extends State<AnimationBuilderPage> with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration:  Duration(seconds: 2));
    _animation = Tween(begin: 0.0, end: 200.0).animate(_controller)
    ..addStatusListener((staue){
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
          GrowTransition(animation: _animation, child: FlutterLogo()),
        ],
      ),
    );
  }
}

class GrowTransition extends StatelessWidget{
  final Animation<double> animation;
  final Widget child;
  GrowTransition({Key key, this.animation, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AnimatedBuilder(
          animation: animation,
          child: child,
          builder: (context,child){
            return Container(
              width: animation.value,
              height: animation.value,
              child: child,
            );
          },
      ),
    );
  }
}

class AnimationLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlutterLogo();
  }
}

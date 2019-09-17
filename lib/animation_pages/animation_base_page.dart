import 'package:flutter/material.dart';

class AnimationBasePage extends StatefulWidget {
  final String title;

  const AnimationBasePage(this.title, {Key key}) : super(key: key);

  @override
  _AnimationBasePageState createState() => _AnimationBasePageState();
}

class _AnimationBasePageState extends State<AnimationBasePage> with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _controller;
  double _animationValue;
  AnimationStatus _animationStaue;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration:  Duration(seconds: 2));
    _animation = Tween<double>(begin: 0.0, end: 200.0).animate(_controller)
    ..addListener((){
      setState(() {
        _animationValue = _animation.value;
      });
    })
    ..addStatusListener((staue){
      _animationStaue = staue;
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
          Text('AnimationValue:${_animationValue.toString()}'),
          Text('AnimationStaue:${_animationStaue.toString()}'),
          Container(
            child: FlutterLogo(),
            width: _animationValue,
            height: _animationValue,
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AnimationCurvesPage extends StatefulWidget {
  final String title;

  const AnimationCurvesPage(this.title, {Key key}) : super(key: key);

  @override
  _AnimationCurvesPageState createState() => _AnimationCurvesPageState();
}

class _AnimationCurvesPageState extends State<AnimationCurvesPage>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn)
      ..addStatusListener((staue) {
        ///通过状态的监听操作 呼吸灯的效果
        if (staue == AnimationStatus.completed) {
          _controller.reverse();
        } else if (staue == AnimationStatus.dismissed) {
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
              RaisedButton(
                  child: Text('开始'),
                  onPressed: () {
                    _controller.reset();
                    _controller.forward();
                  }),
              RaisedButton(
                  child: Text('停止'),
                  onPressed: () {
                    _controller.stop();
                  }),
              RaisedButton(
                  child: Text('倒放'),
                  onPressed: () {
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
  final _opacityTween = Tween<double>(begin: 0.1, end: 1.0);
  final _sizeTween = Tween<double>(begin: 0.0, end: 200.0);

  AnimationView({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> _animation = listenable;
    return ClipOval(
      child: Opacity(
        opacity: _opacityTween.evaluate(_animation),
        child: Container(
          width: _sizeTween.evaluate(_animation),
          height: _sizeTween.evaluate(_animation),
          decoration: BoxDecoration(color: Colors.green),
        ),
      ),
    );
  }
}

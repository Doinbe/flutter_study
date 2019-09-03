import 'package:flutter/material.dart';

import 'animation_base_page.dart';
import 'animation_builder_page.dart';
import 'animation_curves_page.dart';
import 'animation_widget_page.dart';

class AnimationPage extends StatefulWidget {
  final String title;

  const AnimationPage(this.title, {Key key}) : super(key: key);

  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text('基础动画Animation'),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return AnimationBasePage('基础动画Animation');
                }));
              }),
          RaisedButton(
              child: Text('动画AnimationWidget'),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return AnimationWidgetPage('动画AnimationWidget');
                }));
              }),
          RaisedButton(
              child: Text('动画AnimationBuilder'),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return AnimationBuilderPage('动画AnimationBuilder');
                }));
              }),
          RaisedButton(
              child: Text('同步动画CurvedAnimation'),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder:(context) => AnimationCurvesPage('同步动画CurvedAnimation')));
              }),
        ],
      ),
    );
  }
}

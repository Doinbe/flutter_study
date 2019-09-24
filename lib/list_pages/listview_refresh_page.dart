import 'package:flutter/material.dart';

class ListViewRefreshPage extends StatefulWidget {
  final String title;

  const ListViewRefreshPage(this.title,{Key key}) : super(key: key);
  @override
  _ListViewRefreshPageState createState() => _ListViewRefreshPageState();
}

class _ListViewRefreshPageState extends State<ListViewRefreshPage> {
  var lists = <String>['A','S','D','F','G','h','j','k','l'];
  ScrollController _controller = ScrollController();

  @override
  void initState() {
    _controller.addListener((){
      if(_controller.position.pixels == _controller.position.maxScrollExtent){
        _loadData();
      }
    });
    super.initState();
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
      body: RefreshIndicator(
          child: ListView(
            controller: _controller,
            children: _listWidgets(),
          ),
          onRefresh: _handleRefresh),
    );
  }

  _loadData() async{
    await Future.delayed(Duration(milliseconds: 200));
    setState(() {
      var newList = List<String>.from(lists);
      newList.addAll(lists);
      lists = newList;
    });
  }

  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      lists = lists.reversed.toList();
    });
    return null;
  }

  List<Widget> _listWidgets(){
    return lists.map((item){
       return _item(item);
    }).toList();
  }

  Widget _item(String item) {
    return Container(
      height: 100,
      margin: EdgeInsets.only(bottom:5),
      decoration: BoxDecoration(color: Colors.blue),
      alignment: AlignmentDirectional.center,
      child: Text(item,style: TextStyle(color: Colors.white,fontSize: 22),),
    ) ;
  }


}

class JsonMdel{
  String url;
  List<Tab> tabs;

  JsonMdel({this.url, this.tabs});

  JsonMdel.fromJson(Map<String, dynamic> json){
    url= json['url'];
    tabs= (json['tabs'] as List).map((v){
      return Tab.fromJson(v);
    }).toList();
  }

}

class Tab{
  String labelName;
  String groupChannelCode;
  Tab({this.labelName, this.groupChannelCode});

  Tab.fromJson(Map<String, dynamic> json){
    labelName = json['labelName'];
    groupChannelCode = json['groupChannelCode'];
  }

}
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class ContentModel{
  String status;
  String message;
  Data data;
  ContentModel.fromMap(Map<String,dynamic> json){
    this.status = json["status"];
    this.message = json["message"];
    var data = json["data"];
    this.data = Data.fromMap(data["title"],data['content']);
  }
}
Future<List<contentItem>> getContents() async{
  var jsonString = await rootBundle.loadString('json/test.json');
    final jsonResult = json.decode(jsonString);
    Map map = new Map<String, dynamic>.from(jsonResult);
    var data = jsonResult["data"];
    List<contentItem> contents = new List();
    for(Map<String,dynamic>map in data["content"]){
      contents.add(contentItem.fromMap(map));
    }
    return contents;
}
class Data{
  Datatitle title;
  List <contentItem> contents;
  Data.fromMap(Map<String,dynamic> title,List<dynamic> content){

    this.title = Datatitle.fromMap(title);
    var contents = content;
    this.contents = content.map((item) {
      return contentItem.fromMap(item);
    }).toList();
  }
}
class Datatitle{
  String id;
  String name;
  Datatitle.fromMap(Map<String,dynamic>title){
    this.id = title['id'];
    this.name = title['name'];
  }
}
class contentItem{
  String id;
  String value;
  contentItem.fromMap(Map<String,dynamic>title){
    this.id = title['id'];
    this.value = title['value'];
  }
}



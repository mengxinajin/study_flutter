import 'package:flutter/material.dart';
import 'model/post.dart';

void main() => runApp(Home());
class Home extends StatelessWidget{
  Widget _listItemBuilder(BuildContext context,int index){
    return Container(
      color: Colors.black12,
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Image.network(posts[index].imgUrl),

          SizedBox(height: 5,),

          Text(
              posts[index].title,
              style: Theme.of(context).textTheme.headline6,
          ),
          Text(
            posts[index].author,
            style: Theme.of(context).textTheme.headline6,
          )
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(

          title: Text('Hello'),
          elevation: 23.0,//阴影
        ),
        body: ListView.builder(
          itemCount: posts.length,
          itemBuilder: _listItemBuilder,
          ),

      ),
      theme: ThemeData(
          primaryColor: Colors.blueAccent
      ),
    );

  }
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //隐藏debug条
      title: '首页',
      home: Scaffold(
        appBar: AppBar(
          title: Text('首页'),
        ),
        body: Center(
          child: Container(
            child: Text(''),
          ),
        ),
      ),
    );
  }
}
class App extends StatelessWidget{
    @override
    Widget build(BuildContext context) {

    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(

          title: Text('Hello'),
          elevation: 0.0,//阴影
        ),
        body: Hello(),

    ),
    theme: ThemeData(
      primaryColor: Colors.cyan
    ),
    );

  }
}

class Hello extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Text('Hello',
        textDirection: TextDirection.ltr,
        style: TextStyle(
            fontSize: 40.0,
            fontWeight: FontWeight.bold,
            color: Colors.blue
        ),
      ),
    );
  }
}





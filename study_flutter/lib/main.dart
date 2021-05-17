////import 'package:flutter/material.dart';
////import 'model/post.dart';
////import 'demo/Listviewdemo.dart';
////void main() => runApp(Home());
////class Home extends StatelessWidget{
////  @override
////  Widget build(BuildContext context) {
////
////    // TODO: implement build
////    return MaterialApp(
////      debugShowCheckedModeBanner: false,
////      theme: ThemeData(
////        primarySwatch: Colors.blue,
////        highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
////        splashColor: Colors.white70,
////      ),
////      home: DefaultTabController(
////        length: 3,
////        child: Scaffold(
////          appBar: AppBar(
////            title: Text('Hello'),
////            actions: <Widget>[
////              IconButton(icon: Icon(Icons.search),
////                tooltip: "navigation",
////                onPressed: () => debugPrint("search pressed"),
////              ),
////            ],
////
////            elevation: 0.0,//阴影
////            bottom: TabBar(
////              unselectedLabelColor: Colors.black38,
////              indicatorColor: Colors.black45,
////              indicatorSize: TabBarIndicatorSize.label,
////                indicatorWeight: 1.0,
////              tabs: <Widget>[
////                Tab(icon: Icon(Icons.local_activity),),
////                Tab(icon: Icon(Icons.change_history),),
////                Tab(icon: Icon(Icons.directions_bike),),
////              ],
////            ),
////          ),
////          body: TabBarView(
////            children: <Widget>[
////              Icon(Icons.local_activity,size: 128,color: Colors.black12,),
////              Icon(Icons.change_history,size: 128,color: Colors.black12,),
////              Icon(Icons.directions_bike,size: 128,color: Colors.black12,),
////            ],
////          ),
////          drawer: Drawer(
////            child: Text('data'),
////          ),
////          bottomNavigationBar: BottomNavigationBar(
////            currentIndex: 1,
////            backgroundColor: Colors.white,
////            items: [
////              BottomNavigationBarItem(
////                  icon: Icon(Icons.access_alarm,color: Colors.grey,),
////                  activeIcon: Icon(Icons.access_alarm,color: Colors.blue,),
////                  title: Text('闹钟')),
////              BottomNavigationBarItem(icon: Icon(Icons.ac_unit),title: Text('白雪')),
////            ],
////          )
////        ),
////
////      )
////
////    );
////
////  }
////}
////
////class MyDrawer extends Drawer{
////
////
////}
//
//import 'package:flutter/material.dart';
//import 'dart:async';
//
//main(List<String> args) {
//  runApp(
//      MaterialApp(
//        home: Scaffold(
//          appBar: AppBar(
//            title: Text("Widget"),
//          ),
//          body: Center(
//            child: DemoStateWidget('Hello World'),
//          ),
//        ),
//      )
//  );
//}
//class DemoStateWidget extends StatefulWidget { final String text;
//////通过构造⽅法传值
//DemoStateWidget(this.text);
//
/////主要是负责创建state @override
//_DemoStateWidgetState createState() => _DemoStateWidgetState(text);
//}
//
//class _DemoStateWidgetState extends State<DemoStateWidget> {
//  String text;
//  _DemoStateWidgetState(this.text);
//
//  @override
//  void initState() {
//    ///初始化，这个函数在⽣命周期中只调⽤⼀次super.initState();
//    ///定时2秒
//    ///
//    new Future.delayed(const Duration(seconds: 1), () {
//      setState(() {
//        text = "这就变了数值";
//      });
//    });
//  }
//
//  @override
//  void dispose() {
//    ///销毁super.dispose();
//  }
//
//  @override
//  void didChangeDependencies() {
//    ///在initState之后调 Called when a dependency of this [State] object changes. super.didChangeDependencies();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//  return Container(
//      child: Text(text ?? "这就是有状态DMEO"),
//    );
//  }
//}




import 'package:flutter/material.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'model/contentModel.dart';
import 'dart:io';
import'package:http/http.dart'as http;
import 'package:dio/dio.dart';
//import 'httpRequest.dart';
import 'http_request.dart';
main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: '学习flutter',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('首页'),
        ),
      ),
    );
  }
}



//void dioNetwork() async {
//  // 1.创建Dio请求对象
//  final dio = Dio();
//
//  // 2.发送网络请求
//  var urlStr = 'https://r.inews.qq.com/getQQNewsUnreadList';
//  final response = await dio.get(urlStr);
//
//  // 3.打印请求结果
//  if (response.statusCode == HttpStatus.ok) {
//    print(response.data);
//  } else {
//    print("请求失败：${response.statusCode}");
//  }
//}
//void requestNetwork() async {
//  // 1.创建HttpClient对象
//  final httpClient = HttpClient();
//
//  // 2.构建请求的uri
//  var urlStr = 'https://r.inews.qq.com/getQQNewsUnreadList';
//  final uri = Uri.parse(urlStr);
//
//  // 3.构建请求
//  final request = await httpClient.getUrl(uri);
//
//  // 4.发送请求，必须
//  final response = await request.close();
//  if (response.statusCode == HttpStatus.ok) {
//    print(await response.transform(utf8.decoder).join());
//  } else {
//    print(response.statusCode);
//  }
//}
//void httpNetwork() async {
//  // 1.创建Client
//  final client = http.Client();
//  var urlStr = 'https://r.inews.qq.com/getQQNewsUnreadList';
//  // 2.构建uri
//  final url = Uri.parse(urlStr);
//
//  // 3.发送请求
//  final response = await client.get(url);
//
//  // 4.获取结果
//  if (response.statusCode == HttpStatus.ok) {
//    print(response.body);
//  } else {
//    print(response.statusCode);
//  }
//}
//
//class MyApp extends StatelessWidget {
//
//  @override
//  Widget build(BuildContext context) {
//    HttpRequest.request("getQQNewsUnreadList").then((value){
//      print('返回结果 ：$value');
//    });
//    return MaterialApp(
//      debugShowCheckedModeBanner: false,
//      theme: ThemeData(
//        primarySwatch: Colors.red,
//        primaryColorLight:Colors.cyan,
//      ),
//      home: DefaultTabController(length: 3, child:
//        Scaffold(
//          appBar: AppBar(
//            title: Text("HelloWorld"),
//            bottom: TabBar(tabs: [
//              Text('精选',style: TextStyle(
//                color: Colors.green,
//                fontSize: 16.0
//               ),),
//              Text('猜你喜欢',style: TextStyle(
//                  color: Colors.indigoAccent,
//                  fontSize: 16.0
//              ),),
//              Text('母婴'),
//            ]),
//          ),
//          body:  TabBarView(
//            children: [
//              Text('精选',style: TextStyle(
//                  color: Colors.green,
//                  fontSize: 16.0
//              ),),
//              Text('猜你喜欢',style: TextStyle(
//                  color: Colors.indigoAccent,
//                  fontSize: 16.0
//              ),),
//              Text('母婴'),
//            ],
//          ),
//          bottomNavigationBar: BottomNavigationBar(
//            items: [
//              BottomNavigationBarItem(icon: Icon(Icons.home),label: '首页'),
//              BottomNavigationBarItem(icon: Icon(Icons.message),label: '消息'),
//              BottomNavigationBarItem(icon: Icon(Icons.hot_tub),label: '点赞'),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}










class MyHomeNotificationDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyHomeNotificationDemoState();
}

class MyHomeNotificationDemoState extends State<MyHomeNotificationDemo> {
  int _progress = 0;

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (ScrollNotification notification) {
        // 1.判断监听事件的类型
        if (notification is ScrollStartNotification) {
          print("开始滚动.....");
        } else if (notification is ScrollUpdateNotification) {
          // 当前滚动的位置和总长度
          final currentPixel = notification.metrics.pixels;
          final totalPixel = notification.metrics.maxScrollExtent;
          double progress = currentPixel / totalPixel;
          setState(() {
            _progress = (progress * 100).toInt();
          });
          print("正在滚动：${notification.metrics.pixels} - ${notification.metrics.maxScrollExtent}");
        } else if (notification is ScrollEndNotification) {
          print("结束滚动....");
        }
        return false;
      },
      child: Stack(
        alignment: Alignment(.9, .9),
        children: <Widget>[
          ListView.builder(
              itemCount: 100,
              itemExtent: 60,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(title: Text("item$index"));
              }
          ),
          CircleAvatar(
            radius: 30,
            child: Text("$_progress%"),
            backgroundColor: Colors.black54,
          )
        ],
      ),
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  ScrollController _controller;
  bool _isShowTop = false;

  @override
  void initState() {
    // 初始化ScrollController
    _controller = ScrollController();

    // 监听滚动
    _controller.addListener(() {
      var tempSsShowTop = _controller.offset >= 1000;
      if (tempSsShowTop != _isShowTop) {
        setState(() {
          _isShowTop = tempSsShowTop;
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView展示"),
      ),
      body: ListView.builder(
          itemCount: 100,
          itemExtent: 60,
          controller: _controller,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(title: Text("item$index"));
          }
      ),
      floatingActionButton: !_isShowTop ? null : FloatingActionButton(
        child: Icon(Icons.arrow_upward),
        onPressed: () {
          _controller.animateTo(0, duration: Duration(milliseconds: 1000), curve: Curves.ease);
        },
      ),
    );
  }
}
class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return showCustomScrollView();
  }

  Widget showCustomScrollView() {
    return new CustomScrollView(
        slivers: <Widget>[
        const SliverAppBar(
        expandedHeight: 250.0,
        flexibleSpace: FlexibleSpaceBar(
        title: Text('Slivers'),
    background: Image(
    image: NetworkImage(
    "https://tva1.sinaimg.cn/large/006y8mN6gy1g72j6nk1d4j30u00k0n0j.jpg",
    ),
    fit: BoxFit.cover,
    ),
    ),
    ),
    new SliverGrid(
    gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(
    maxCrossAxisExtent: 200.0,
    mainAxisSpacing: 10.0,
    crossAxisSpacing: 10.0,
    childAspectRatio: 4.0,
    ),
    delegate: new SliverChildBuilderDelegate(
    (BuildContext context, int index) {
    return new Container(
    alignment: Alignment.center,
    color: Colors.teal[100 * (index % 9)],
    child: new Text('grid item $index'),
    );
    },
    childCount: 5,
    ),
    ),
    SliverFixedExtentList(
    itemExtent: 50.0,
    delegate: SliverChildBuilderDelegate(
    (BuildContext context, int index) {
    return new Container(
    alignment: Alignment.center,
    color: Colors.lightBlue[100 * (index % 9)],
    child: new Text('list item $index'),
    );
    },
    childCount: 10
    ),
    ),
    ],
    );
  }
}
class HomeContent1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverSafeArea(
          sliver: SliverPadding(
            padding: EdgeInsets.all(8),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return Container(
                      alignment: Alignment(0, 0),
                      color: Colors.orange,
                      child: Text("item$index"),
                    );
                  },
                  childCount: 20
              ),
            ),
          ),
        )
      ],
    );
  }
}

class MyGridExtentDemo1 extends StatelessWidget {

  List<Widget> getGridWidgets() {
    return List.generate(20, (index) {
      return Container(
        color: Colors.deepPurple,
        alignment: Alignment(0, 0),
        child: Text("item$index", style: TextStyle(fontSize: 20, color: Colors.white)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      padding: EdgeInsets.all(10),
      maxCrossAxisExtent: 200,
      crossAxisSpacing: 10,
      childAspectRatio: 1.0,
      mainAxisSpacing: 10,
      children: getGridWidgets(),
    );
  }
}
class MyHomeBodyGridViewBuild extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _GridViewBuildDemoState();
  }
}
class _GridViewBuildDemoState extends State<MyHomeBodyGridViewBuild> {
  List<contentItem> contents = [];
  // 在初始化状态的方法中加载数据
  @override
  void initState() {
    getContents().then((contents) {
      print('获取的数据 ： $contents');
      setState(() {
        this.contents = contents;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 1,
              crossAxisSpacing: 10,
              childAspectRatio: 1.6
          ),
          itemCount: contents.length,
          itemBuilder: (BuildContext context, int index) {
            return  Column(
//                crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
//                    width: 180,
//                    height: 180,
                  color: Colors.cyanAccent,
                  child:  ListTile(
                    leading: Icon(Icons.message, size: 36,),
                    title: Text(contents[index].id),
                    subtitle: Text(contents[index].value),
                  ),
                )
              ],
            );
          }
      ),
    );
  }
}

class MyGridCountDemo1 extends StatelessWidget {

  List<Widget> getGridWidgets() {
    return List.generate(20, (index) {
      return Container(
        color: Colors.cyan,
        alignment: Alignment(0, 0),
        child: Text("item$index", style: TextStyle(fontSize: 20, color: Colors.white)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(padding: EdgeInsets.all(10),crossAxisCount: 3,mainAxisSpacing: 10,crossAxisSpacing: 10,childAspectRatio: 1.0,children:
      getGridWidgets()
    ,);
  }
}

class MyGridExtentDemo extends StatelessWidget {

  List<Widget> getGridWidgets() {
    return List.generate(20, (index) {
      return Container(
        color: Colors.deepPurple,
        alignment: Alignment(0, 0),
        child: Text("item$index", style: TextStyle(fontSize: 20, color: Colors.white)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1.0
      ),
      children: getGridWidgets(),
    );
  }
}

class MyGridCountDemo extends StatelessWidget {

  List<Widget> getGridWidgets() {
    return List.generate(20, (index) {
      return Container(
        color: Colors.cyan,
        alignment: Alignment(0, 0),
        child: Text("item$index", style: TextStyle(fontSize: 20, color: Colors.white)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1.0
      ),
      children: getGridWidgets(),
    );
  }
}

class MySeparatedDemo extends StatelessWidget {
  Divider blueColor = Divider(color: Colors.blue);
  Divider redColor = Divider(color: Colors.red);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Icon(Icons.people),
            title: Text("联系人${index+1}"),
            subtitle: Text("联系人电话${index+1}"),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return index % 2 == 0 ? redColor : blueColor;
        },
        itemCount: 100
    );
  }
}

class MyHomeBody8 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MyHomeBodyState();
  }
}

class MyHomeBodyState extends State<MyHomeBody8> {
  List<contentItem> contents = [];
  // 在初始化状态的方法中加载数据
  @override
  void initState() {
    getContents().then((contents) {
      print('获取的数据 ： $contents');
      setState(() {
        this.contents = contents;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contents.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.message, size: 36,),
                title: Text(contents[index].id),
                subtitle: Text(contents[index].value),
              ),
            ],
          ),
        );
      },
    );
  }
}


class MyHomeBody7 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 100,
        itemExtent: 80,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(title: Text("标题$index"), subtitle: Text("详情内容$index"));
        }
    );
  }
}
class MyHomeBody6 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      itemExtent: 200,
      children: <Widget>[
        Container(color: Colors.red, width: 200),
        Container(color: Colors.green, width: 200),
        Container(color: Colors.cyan, width: 200),
        Container(color: Colors.purple, width: 200),
        Container(color: Colors.orange, width: 200),
      ],
    );
  }
}
class MyHomeBody5 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.people, size: 36,),
          title: Text("联系人"),
          subtitle: Text("联系人信息"),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        ListTile(
          leading: Icon(Icons.email, size: 36,),
          title: Text("邮箱"),
          subtitle: Text("邮箱地址信息"),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        ListTile(
          leading: Icon(Icons.message, size: 36,),
          title: Text("消息"),
          subtitle: Text("消息详情信息"),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        ListTile(
          leading: Icon(Icons.map, size: 36,),
          title: Text("地址"),
          subtitle: Text("地址详情信息"),
          trailing: Icon(Icons.arrow_forward_ios),
        )
      ],
    );
  }
}
class MyHomeBody4 extends StatelessWidget {
  final TextStyle textStyle = TextStyle(fontSize: 20, color: Colors.redAccent);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("人的一切痛苦，本质上都是对自己无能的愤怒。", style: textStyle),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("人活在世界上，不可以有偏差；而且多少要费点劲儿，才能把自己保持到理性的轨道上。", style: textStyle),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("我活在世上，无非想要明白些道理，遇见些有趣的事。", style: textStyle),
        )
      ],
    );
  }
}
class MyHomeBody3 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final jsonInfo = {
      "nickname": "LiLy",
      "level": 15,
      "courses": ["语文", "数学", "英语"],
      "register_date": "2021-5-10",
      "computer": {
        "brand": "MackBook pro",
        "price": 15000
      }
    };






    var fu = rootBundle.loadString('json/test.json');
    fu.then((value){
      final jsonResult = json.decode(value);
     Map map = new Map<String, dynamic>.from(jsonResult);
      var model = ContentModel.fromMap(map);
//      print(model.data.content[0].value);
    });
    return Center(

      child: Container(
        width: 450,
        height: 200,
//        color: Colors.yellow,
        child: Image.asset("images/test.jpeg"),
      ),
    );
  }
}
Future<String> loadAsset() async {
  return await rootBundle.loadString('json/test.json');
}
class MyHomeBody2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Image.network(
          "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201704%2F17%2F20170417215834_GMy2C.jpeg&refer=http%3A%2F%2Fb-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1622886333&t=87fdec2b7bc2350c88052a296223c065",
          alignment: Alignment.topCenter,
          repeat: ImageRepeat.repeatY,
          color: Colors.red,
          colorBlendMode: BlendMode.colorDodge,
        ),
        width: 300,
        height: 300,
        color: Colors.yellow,
      ),
    );
  }
}
class MyHomeBody1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FloatingActionButton(
          child: Text("FloatingActionButton"),
          onPressed: () {
            print("FloatingActionButton Click");
          },
        ),
        RaisedButton(
          child: Text("RaisedButton"),
          onPressed: () {
            print("RaisedButton Click");
          },
        ),
        FlatButton(
          child: Text("FlatButton"),
          onPressed: () {
            print("FlatButton Click");
          },
        ),
        RaisedButton(
          child: Text("同意协议", style: TextStyle(color: Colors.white)),
          color: Colors.orange, // 按钮的颜色
          highlightColor: Colors.orange[700], // 按下去高亮颜色
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(500)), // 圆角的实现
          onPressed: () {
            print("同意协议");
          },
        ),
        OutlineButton(
          child: Text("OutlineButton"),
          onPressed: () {
            print("OutlineButton Click");
          },
        )
      ],
    );
  }
}

class MyHomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: "《定风波》", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black)),
          TextSpan(text: "苏轼", style: TextStyle(fontSize: 18, color: Colors.redAccent)),
          TextSpan(text: "\n莫听穿林打叶声，何妨吟啸且徐行。\n竹杖芒鞋轻胜马，谁怕？一蓑烟雨任平生。")
        ],
      ),
      style: TextStyle(fontSize: 20, color: Colors.purple),
      textAlign: TextAlign.center,
    );
  }
}

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("HomeBody build");
    return MyCounterWidget();
  }
}


class MyCounterWidget extends StatefulWidget {

  MyCounterWidget() {
    print("执行了MyCounterWidget的构造方法");
  }

  @override
  State<StatefulWidget> createState() {
    print("执行了MyCounterWidget的createState方法");
    // 将创建的State返回
    return MyCounterState();
  }
}

class MyCounterState extends State<MyCounterWidget> {
  int counter = 0;
  ButtonStyle btnstyle = ButtonStyle(
      //背景颜色
      backgroundColor: MaterialStateProperty.resolveWith((states) {
//        //设置按下时的背景颜色
//          if (states.contains(MaterialState.pressed)) {
//          return Colors.blue[200];
//       }
    //默认不使用背景颜色
      return Colors.blueAccent;
      }),
    overlayColor: MaterialStateProperty.all(Colors.blue),
    //设置阴影  不适用于这里的TextButton
    elevation: MaterialStateProperty.all(0),
    //设置按钮内边距
    padding: MaterialStateProperty.all(EdgeInsets.all(10)),
    //设置按钮的大小
//    minimumSize: MaterialStateProperty.all(Size(200, 100)),
    );
  MyCounterState() {
    print("执行MyCounterState的构造方法");
  }

  @override
  void initState() {
    super.initState();
    print("执行MyCounterState的init方法");
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("执行MyCounterState的didChangeDependencies方法");
  }

  @override
  Widget build(BuildContext context) {
    print("执行执行MyCounterState的build方法");
    return Center(
      child: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                style:btnstyle,
                child: Text("+1", style: TextStyle(fontSize: 18, color: Colors.white),),
                onPressed: () {
                  setState(() {
                    counter++;
                  });
                },
              ),
              ElevatedButton(
                style:btnstyle,
                child: Text("-1", style: TextStyle(fontSize: 18, color: Colors.white),),
                onPressed: () {
                  setState(() {
                    counter--;
                  });
                },
              )
            ],
          ),
          Text("当前计数：$counter", style: TextStyle(fontSize: 30),)
        ],
      ),
    );
  }

  @override
  void didUpdateWidget(MyCounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("执行MyCounterState的didUpdateWidget方法");
  }

  @override
  void dispose() {
    super.dispose();
    print("执行MyCounterState的dispose方法");
  }
}
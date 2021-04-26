import 'package:flutter/material.dart';
import 'model/post.dart';
import 'demo/Listviewdemo.dart';
void main() => runApp(Home());
class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
        splashColor: Colors.white70,
      ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Hello'),
            actions: <Widget>[
              IconButton(icon: Icon(Icons.search),
                tooltip: "navigation",
                onPressed: () => debugPrint("search pressed"),
              ),
            ],

            elevation: 0.0,//阴影
            bottom: TabBar(
              unselectedLabelColor: Colors.black38,
              indicatorColor: Colors.black45,
              indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 1.0,
              tabs: <Widget>[
                Tab(icon: Icon(Icons.local_activity),),
                Tab(icon: Icon(Icons.change_history),),
                Tab(icon: Icon(Icons.directions_bike),),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Icon(Icons.local_activity,size: 128,color: Colors.black12,),
              Icon(Icons.change_history,size: 128,color: Colors.black12,),
              Icon(Icons.directions_bike,size: 128,color: Colors.black12,),
            ],
          ),
          drawer: Drawer(
            child: Text('data'),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: 1,
            backgroundColor: Colors.white,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.access_alarm,color: Colors.grey,),
                  activeIcon: Icon(Icons.access_alarm,color: Colors.blue,),
                  title: Text('闹钟')),
              BottomNavigationBarItem(icon: Icon(Icons.ac_unit),title: Text('白雪')),
            ],
          )
        ),

      )

    );

  }
}

class MyDrawer extends Drawer{


}





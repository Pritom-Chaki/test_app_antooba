import 'package:flutter/material.dart';
import 'package:test_app/others/custom_app_bar.dart';



class TabBarDemo extends StatefulWidget {
  const TabBarDemo({Key? key}) : super(key: key);

  @override
  _TabBarDemoState createState() => _TabBarDemoState();
}

class _TabBarDemoState extends State<TabBarDemo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Login / Signin Page"),
      body: Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[

          DefaultTabController(
            length: 2, // length of tabs
            initialIndex: 0,
            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
              Container(
                child: const TabBar(
        //change color here
              indicatorColor: Color(0xFFF6990E),
              labelColor:Color(0xFFF6990E), 
              unselectedLabelColor: Color(0xFF838383),
              labelStyle: TextStyle(fontSize: 16),
              tabs: [
                Tab(
                  text: "Login",
                ),
                Tab(
                  text: "Sign Up",
                ),
              ],
                ),
              ),
              Container(
                height: 400, //height of TabBarView
                decoration: const BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.grey, width: 0.5))
                ),
                child: TabBarView(children: <Widget>[

                  //provide screen list
                  Container(
                    child: const Center(
                      child: Text('Display Tab 1', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Container(
                    child: const Center(
                      child: Text('Display Tab 2', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    ),
                  ),
               
                  
                ])
              )
            ])
          ),
        ]),
      ),
    );
  }
}


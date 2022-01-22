 import 'package:flutter/material.dart';

import 'keyword/keyword_add.dart';
import 'search_drop/search_drop.dart';

  
  void main() => runApp( MyApp());
  
  class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const KeyWordAdd(),
    );
  }
}

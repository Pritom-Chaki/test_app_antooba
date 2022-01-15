 import 'package:flutter/material.dart';
import 'package:test_app/auto_complete_textfield.dart';
import 'package:test_app/dropdown/customDropdown.dart';
import 'package:test_app/fiverr/fiverr_screen.dart';
import 'package:test_app/fiverr/fiverr_screen2.dart';
import 'package:test_app/json_data/jason_data_get.dart';
import 'package:test_app/youtube/youtube_player.dart';
import 'package:test_app/youtube/yt_player.dart';
  
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
      home: const JsonDataGetClass(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:news_app/home/home_screen.dart';
import 'package:news_app/my_theme_data.dart';

void main (){
  runApp(MyApp ());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.lightTheme,
      initialRoute: HomeScreen.RouteName ,
      routes:{ HomeScreen.RouteName : (context) => HomeScreen(),
      }
    );
  }

}
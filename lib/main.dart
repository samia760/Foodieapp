import 'package:flutter/material.dart';
import 'package:foodieapp/detailpage.dart';
import 'package:foodieapp/home.dart';
import 'package:foodieapp/provider/my_provider.dart';
import 'package:foodieapp/splash.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final appTitle = 'FOODIE';
  //late final firstname;

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      
      providers: [
         ChangeNotifierProvider(create: (_) => MyProvider()),
      ],
      child: MaterialApp(
       debugShowCheckedModeBanner:false,
    
        title: appTitle,  
       home: Splashscreen(),
       //Splashscreen(),
      
      ),
    );
    }}

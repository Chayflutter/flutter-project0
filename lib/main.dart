import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myapp/pages/home.dart';

void main() async{

  await Hive.initFlutter();
  var box = await Hive.openBox('box');
  
  runApp(MyApp());
  }


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override

  Widget build(BuildContext context){
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Todoapp(),
          
          
      );
  }
}


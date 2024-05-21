import 'package:hive/hive.dart';

class TodoDatabase {

  List todostuff = [];

  final _box = Hive.box('box');


  void creatInitialData(){
    todostuff = [['First task',false]];
  }

  void loadData(){
    todostuff = _box.get('TODOSTUFF');
  }
  void updateDatabase(){
    _box.put('TODOSTUFF',todostuff);
  }
}
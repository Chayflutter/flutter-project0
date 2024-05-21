import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:myapp/Components/dialogthing.dart';
import 'package:myapp/Components/todoTile.dart';
import 'package:myapp/data/database.dart';

class Todoapp extends StatefulWidget {
  const Todoapp({super.key});

  @override
  State<Todoapp> createState() => _TodoappState();
}

class _TodoappState extends State<Todoapp> {
  final _box = Hive.box('box');

  @override
  void initState() {
    if (_box.get('TODOSTUFF') == null) {
      db.creatInitialData();
    }else{
      db.loadData();
    }
    super.initState();
  }

  final _controller = TextEditingController();

  TodoDatabase db = TodoDatabase();

  void checkboxchange(bool? value, int index) {
    setState(() {
      db.todostuff[index][1] = !db.todostuff[index][1];

    });

    db.updateDatabase();
  }

  void saveTask() {
    setState(() {
      db.todostuff.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialogthing(
          controllerthing: _controller,
          onCancel: () => Navigator.of(context).pop(),
          onSave: saveTask,
        );
      },
    );
    
  }

  void deleteTask(int index) {
    setState(() {
      db.todostuff.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(57, 62, 70, 1.000),
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Center(
              child: Text(
            'Todo app',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          )),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          shape: CircleBorder(),
          child: Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: db.todostuff.length,
          itemBuilder: (context, index) {
            return Todotile(
              taskName: db.todostuff[index][0],
              taskCompleted: db.todostuff[index][1],
              onChanged: (value) => checkboxchange(value, index),
              deleteFunction: (context) => deleteTask(index),
            );
          },
        ));
  }
}

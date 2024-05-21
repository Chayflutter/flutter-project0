import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/Components/dialogthing.dart';
import 'package:myapp/Components/todoTile.dart';

class Todoapp extends StatefulWidget{
  const Todoapp({super.key});

  @override
  State<Todoapp> createState() => _TodoappState();
}

class _TodoappState extends State<Todoapp> {
  final _controller = TextEditingController();
  


  List todostuff = [
    ['task1',true],
    ['task2',false],
    ['task3',false],
  ];



 void checkboxchange(bool? value, int index){
setState(() {
  todostuff[index][1] = !todostuff[index][1];
});
 } 

void saveTask(){
  setState(() {
    todostuff.add([ _controller.text, false]);
    _controller.clear();
  });
  Navigator.of(context).pop();
}

void createNewTask(){
  showDialog(context: context, builder: (context) {
    return Dialogthing(
      controllerthing: _controller ,
      onCancel: ()=> Navigator.of(context).pop(),
      onSave: saveTask,
    );
  } ,);
}
void deleteTask(int index){
  setState(() {
    todostuff.removeAt(index);
  });
}
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color.fromRGBO(57,62,70,1.000),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:const  Center(
          child: Text(
            'Todo app', 
            style: TextStyle(color: Colors.white,fontSize: 25, fontWeight: FontWeight.w500,),)),),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        shape: CircleBorder(),
        child: Icon(Icons.add),
      ),
      body:ListView.builder(
        itemCount: todostuff.length,
        itemBuilder: (context, index){
          return Todotile(taskName: todostuff[index][0], taskCompleted: todostuff[index][1], onChanged: (value) => checkboxchange(value, index),deleteFunction: (context)=>deleteTask(index),);
        },
      )
    
    );
  }
}


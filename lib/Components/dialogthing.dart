import 'package:flutter/material.dart';
import 'package:myapp/Components/buttonstuff.dart';

class Dialogthing extends StatelessWidget {
  final controllerthing;   

  final VoidCallback onSave;
  final VoidCallback onCancel;

  Dialogthing({super.key, required this.controllerthing, required this.onCancel, required this.onSave });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blue[500],
      content: Container(
        height: 150,
        child: Column(
          
          children: [
            
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: TextField(
                controller: controllerthing,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 0.0),
                        borderRadius: BorderRadius.circular(2)),
                        
                    hintText: 'Add a new task'),
                
              
              
              ),
            ),
          
          Padding(
            padding: const EdgeInsets.only(top:8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Buttonstuff(text: 'Add', onPressed:  onSave),
                Buttonstuff(text: 'Cancel', onPressed: onCancel),
                ],
            ),
          )
          ],
        ),
      ),
    );
  }
}

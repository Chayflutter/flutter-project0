import 'package:flutter/material.dart';

class Todotile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;

  Todotile(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:25.0, right: 25, top: 25),
      child:  Container(
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
            color: Colors.blue[700], borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            Checkbox(value: taskCompleted, onChanged: onChanged,  activeColor: Colors.black,),
            Text(
              taskName,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, decoration: taskCompleted ?TextDecoration.lineThrough :TextDecoration.none,decorationThickness: 2 ),
            ),
          ],
        ),
      ),
    );
  }
}

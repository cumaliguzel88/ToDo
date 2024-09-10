import 'package:flutter/material.dart';
import 'package:todo/util/my_button.dart';

class DialogBox extends StatelessWidget {
  //create controller for new input task
  final controller;
  //create method for cancel and save
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox(
      {required this.controller, required this.onSave, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 120,
        child: Column(
          children: [
            //get user input(task)
            TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "Add a new Task",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
            //buttons => save+cansel
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //cancel button
                MyButton(text: "Cancel", onPress: onCancel),
                //save button
                MyButton(text: "Save", onPress: onSave),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

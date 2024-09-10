import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  //variable task name;
  final String taskName;
  //check box completed
  final bool taskCompleted;
  //function for chang
  Function(bool?)? onChanged;
  //function delete the task
  Function(BuildContext)? deleteFunction;
  //create constructor for variable and function
  TodoTile({
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
      //careful this widget for usage
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            borderRadius: BorderRadius.circular(15),
            onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor: Colors.red,
          ),
        ]),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(15),
          ),
          padding: EdgeInsets.all(25),
          child: Row(
            children: [
              //check box is it finish?
              Checkbox(
                  checkColor: Colors.white,
                  activeColor: Colors.black,
                  value: taskCompleted,
                  onChanged: onChanged),
              //task name
              Text(
                taskName,
                style: TextStyle(
                    fontSize: 17,
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

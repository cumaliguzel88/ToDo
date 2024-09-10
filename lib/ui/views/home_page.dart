import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/data/database.dart';
import 'package:todo/util/dialog_box.dart';
import 'package:todo/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //reference the hive box
  final _myBox = Hive.box("mybox");
  //controller for crate a new text ,text field
  final _controller = TextEditingController();
  //object from database
  ToDoDataBase db = ToDoDataBase();

  //function checkbox was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

//save a new task function
// have to careful cuzz
  void saveNewTask() {
    setState(() {
      if (_controller.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            "Enter the Task",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
          ),
          backgroundColor: Colors.yellow,
        ));
      } else {
        db.toDoList.add([_controller.text, false]);
        _controller.clear();
      }
    });
    db.updateDataBase();

    Navigator.pop(context);
  }

  //cancel function
  void cancelTheTask() {
    setState(() {
      _controller.clear();
      Navigator.pop(context);
    });
  }

  //delete the task function
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  //create dialog for save or cancel  a new task
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onCancel: cancelTheTask,
            onSave: saveNewTask,
          );
        });
  }

  //first look init
  @override
  void initState() {
    //first time open the app
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadDataDataBase();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        centerTitle: true,
        title: const Text(
          "TO DO ",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        onPressed: createNewTask,
        child: const Icon(
          size: 25,
          Icons.add,
          color: Colors.black,
        ),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
//cg

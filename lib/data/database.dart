import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  //the list storage data
  List toDoList = [];
  //reference the our box
  final _myBox = Hive.box("mybox");
  //fist time opening the app ever
  void createInitialData() {
    toDoList = [
      ["I love my job", false],
      [" Cumali Guzel", false],
    ];
  }

  //load the data
  void loadDataDataBase() {
    toDoList = _myBox.get("TODOLIST");
  }

//update the data base
  void updateDataBase() {
    _myBox.put("TODOLIST", toDoList);
  }
}

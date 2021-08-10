import 'package:flutter/material.dart';

import 'SQLHelper.dart';
import 'TaskDB.dart';

class DataBaseUI extends StatefulWidget {
  @override
  _DataBaseUIState createState() => _DataBaseUIState();
}

class _DataBaseUIState extends State<DataBaseUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BD"),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              SQLHelper.helper
                  .insertData(TaskDB(name: "my new task", isComplete: true));
            },
            child: Text("insert New Task"),
          ),
          ElevatedButton(
            onPressed: () {
              SQLHelper.helper.getAllData();
            },
            child: Text("get All Task"),
          ),
          ElevatedButton(
            onPressed: () {
              SQLHelper.helper.getSingleData(3);
            },
            child: Text("get single Task"),
          ),
          ElevatedButton(
            onPressed: () {
              SQLHelper.helper.deleteTask(2);
            },
            child: Text("delete Task"),
          ),
          ElevatedButton(
            onPressed: () {
              SQLHelper.helper.updateTaskMap(TaskDB(id: 3, isComplete: true));
            },
            child: Text("update Task"),
          ),
        ],
      ),
    );
  }
}

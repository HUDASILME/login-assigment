import 'SQLHelper.dart';

class TaskDB {
  int id;
  String name;
  bool isComplete;

  TaskDB({this.id, this.name, this.isComplete});

  toMap() {
    return {
      SQLHelper.NAME: this.name,
      SQLHelper.IS_COMPLETE: isComplete ? 1 : 0
    };
  }
}

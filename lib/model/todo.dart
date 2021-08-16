import 'package:get/get.dart';

class Todo {
  String? title;
  RxBool complete = false.obs;

  Todo({this.title, required this.complete});

  factory Todo.complted(String title) => Todo(title: title, complete: true.obs);
  factory Todo.incomplted(String title) =>
      Todo(title: title, complete: false.obs);

  void onChange() {
    complete.value = !complete.value;
  }
}

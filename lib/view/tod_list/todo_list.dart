import 'package:flutter/material.dart';
import 'package:flutter_application_1/manager/resource_manager.dart';
import 'package:flutter_application_1/model/todo.dart';
import 'package:get/get.dart';

class TodoList extends StatelessWidget {
  final void Function(Rx<Todo>)? onItemChange;
  final List<Rx<Todo>>? todos;

  const TodoList({Key? key, this.onItemChange, this.todos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Rx<Todo>> _todoDisplay = todos ?? List<Rx<Todo>>.empty().obs;
    return _todoDisplay.isNotEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _todoDisplay.map((todo) => _itemTodo(todo)).toList(),
          )
        : Center(
            child: Container(
              child: Text(
                "EMPTY",
                textAlign: TextAlign.center,
                style:
                    ResourceManager().text!.normalStyle.copyWith(fontSize: 50),
              ),
            ),
          );
  }

  Widget _itemTodo(Rx<Todo> todo) {
    return Obx(
      () => Row(mainAxisSize: MainAxisSize.min, children: [
        Checkbox(
            value: todo.value.complete.value,
            onChanged: onItemChange != null
                ? (value) => onItemChange!((todo))
                : (_) {}),
        Text(todo.value.title ?? "")
      ]),
    );
  }
}

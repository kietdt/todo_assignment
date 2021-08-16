import 'package:flutter_application_1/model/todo.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("value complete is false by Todo.incomplted constructor", () {
    final Todo todo = Todo.incomplted("Todo 1");
    expect(todo.complete.value, false);
  });
  test(
      "value complete is false by Todo.incomplted constructor, onChange called it's will be true",
      () {
    final Todo todo = Todo.incomplted("Todo 1");
    todo.onChange();
    expect(todo.complete.value, true);
  });
  test("value complete is true by Todo.complted constructor", () {
    final Todo todo = Todo.complted("Todo 1");
    expect(todo.complete.value, true);
  });
  test(
      "value complete is true by Todo.complted constructor, onChange called 3 times => completed will be false",
      () {
    final Todo todo = Todo.complted("Todo 1");
    todo.onChange();
    todo.onChange();
    todo.onChange();
    expect(todo.complete.value, false);
  });
}

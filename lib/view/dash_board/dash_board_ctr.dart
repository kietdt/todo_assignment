import 'package:flutter/material.dart';
import 'package:flutter_application_1/base/base_controller.dart';
import 'package:flutter_application_1/model/todo.dart';
import 'package:get/get.dart';

import 'dash_board.dart';

enum TabType { All, Complete, InComplete }

class DashBoardCtr extends BaseController<DashBoardState> {
  DashBoardCtr(DashBoardState state) : super(state) {
    todoComplete.value = List<Rx<Todo>>.from(todoAll);
  }

  final PageController pageController = PageController();

  var tabSlected = TabType.All.obs;

  var todoAll = [
    Todo.complted("Todo 1").obs,
    Todo.complted("Todo 2").obs,
    Todo.complted("Todo 3").obs,
    Todo.complted("Todo 4").obs,
    Todo.complted("Todo 5").obs,
    Todo.complted("Todo 6").obs,
    Todo.complted("Todo 7").obs,
    Todo.complted("Todo 8").obs,
    Todo.complted("Todo 9").obs,
    Todo.complted("Todo 10").obs,
  ].obs;

  var todoComplete = List<Rx<Todo>>.empty().obs;

  var todoInComplete = List<Rx<Todo>>.empty().obs;

  void onAllPressed() {
    tabSlected.value = TabType.All;
    pageController.animateTo(0,
        duration: Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  void onCompletedPressed() {
    tabSlected.value = TabType.Complete;
    pageController.animateTo(state!.screen.width,
        duration: Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  void onInCompletedPressed() {
    tabSlected.value = TabType.InComplete;
    pageController.animateTo(state!.screen.width * 2,
        duration: Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  void onItemChange(Rx<Todo> todo) {
    int index = todoAll.indexOf(todo);
    if (index >= 0) {
      todoAll[index].value.onChange();

      todoComplete.value =
          List<Rx<Todo>>.from(todoAll.where((e) => e.value.complete.value));

      todoInComplete.value =
          List<Rx<Todo>>.from(todoAll.where((e) => !e.value.complete.value));
    }
  }

  void onPageChanged(int index) {
    switch (index) {
      case 0:
        tabSlected.value = TabType.All;
        break;
      case 1:
        tabSlected.value = TabType.Complete;
        break;
      case 2:
        tabSlected.value = TabType.InComplete;
        break;
    }
  }
}

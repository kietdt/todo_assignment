import 'package:flutter/material.dart';
import 'package:flutter_application_1/base/base_activity.dart';
import 'package:flutter_application_1/manager/resource_manager.dart';
import 'package:flutter_application_1/view/tod_list/todo_list.dart';
import 'package:get/get.dart';

import 'dash_board_ctr.dart';

class DashBoard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DashBoardState();
  }
}

class DashBoardState extends BaseActivity<DashBoard, DashBoardCtr> {
  @override
  DashBoardCtr initController() {
    return DashBoardCtr(this);
  }

  @override
  Widget body() {
    return SafeArea(
        child: Column(children: [Expanded(child: _pager()), _navigateBar()]));
  }

  Widget _pager() {
    return PageView(
      controller: controller!.pageController,
      onPageChanged: controller!.onPageChanged,
      children: [
        Obx(() => TodoList(
            onItemChange: controller!.onItemChange,
            // ignore: invalid_use_of_protected_member
            todos: controller!.todoAll.value)),
        Obx(() => TodoList(
            onItemChange: controller!.onItemChange,
            // ignore: invalid_use_of_protected_member
            todos: controller!.todoComplete.value)),
        Obx(() => TodoList(
            onItemChange: controller!.onItemChange,
            // ignore: invalid_use_of_protected_member
            todos: controller!.todoInComplete.value))
      ],
    );
  }

  Widget _navigateBar() {
    return Container(
      height: 50,
      child: Row(children: [
        Expanded(
            child: _itemBar(
                type: TabType.All,
                icon: Icons.all_inclusive_rounded,
                onTap: controller!.onAllPressed)),
        Expanded(
            child: _itemBar(
                type: TabType.Complete,
                icon: Icons.done,
                onTap: controller!.onCompletedPressed)),
        Expanded(
            child: _itemBar(
                type: TabType.InComplete,
                icon: Icons.pending,
                onTap: controller!.onInCompletedPressed))
      ]),
    );
  }

  Widget _itemBar({
    TabType? type,
    IconData? icon,
    Function()? onTap,
  }) {
    return Obx(() => InkWell(
        onTap: onTap,
        child: Container(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(icon,
              color: controller!.tabSlected.value == type
                  ? ResourceManager().color!.primary
                  : ResourceManager().color!.des),
          Text(
            type.toString().replaceAll("TabType.", ""),
            style: controller!.tabSlected.value == type
                ? ResourceManager()
                    .text!
                    .boldStyle
                    .copyWith(color: ResourceManager().color!.primary)
                : ResourceManager().text!.normalStyle,
          )
        ]))));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_1/manager/resource_manager.dart';

import 'base_controller.dart';
import 'base_fragment.dart';

//created by Kietdt
abstract class BaseActivity<S extends StatefulWidget, C extends BaseController>
    extends BaseFragment<S, C> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  PreferredSizeWidget? appBar;
  Widget? floatingActionButton() => null;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Stack(children: [
      buildBackground(),
      GestureDetector(
        child: _scaffold(),
        onTap: controller?.hideKeyboard,
      ),
      buildLoading(),
    ]);
  }

  PreferredSizeWidget? buildAppbar() => null;

  Widget buildBackground() =>
      Container(color: ResourceManager().color!.background);

  _scaffold() {
    return Scaffold(
      key: scaffoldKey,
      appBar: buildAppbar() ?? appBar,
      body: body(),
      backgroundColor: Colors.transparent,
      floatingActionButton: floatingActionButton(),
    );
  }

  Widget body();
}

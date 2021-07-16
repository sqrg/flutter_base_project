import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';

import 'package:flutter_base_project/app.router.dart';

import 'package:flutter_base_project/core/viewmodels/debug/debug_viewmodel.dart';

class DebugView extends StatelessWidget {
  DebugView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DebugViewModel>.reactive(
      viewModelBuilder: () => DebugViewModel(),
      builder: (context, vm, child) => Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.only(top: 40),
            child: Column(
              children: [
                TextButton(
                  child: Text('Sarasa'),
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.loginView);
                  },
                ),
                TextButton(
                  child: Text(
                    'Alert 1',
                    style: TextStyle(backgroundColor: Theme.of(context).backgroundColor),
                  ),
                  onPressed: () {
                    vm.showDialog1();
                  },
                ),
                TextButton(
                  child: Text('Alert 2'),
                  onPressed: () {
                    vm.showDialog2();
                  },
                ),
                TextButton(
                  child: Text('Alert 2'),
                  onPressed: () {
                    vm.showConfirmation();
                  },
                ),
                TextButton(
                  child: Text('Toggle theme'),
                  onPressed: () {
                    vm.toggleTheme();
                  },
                ),
                TextButton(
                  child: Text('Notification'),
                  onPressed: () {
                    vm.showNotification();
                  },
                ),
                TextButton(
                  child: Text('Toast'),
                  onPressed: () {
                    vm.showToast();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

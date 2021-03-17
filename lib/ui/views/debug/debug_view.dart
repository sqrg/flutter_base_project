import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';

import 'package:flutter_base_project/core/viewmodels/debug/debug_viewmodel.dart';

class DebugView extends StatelessWidget {
  DebugView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DebugViewModel>.reactive(
      viewModelBuilder: () => DebugViewModel(),
      builder: (context, vm, child) => Scaffold(
        backgroundColor: Colors.blue,
        body: SafeArea(
          child: Container(
            child: Column(
              children: [
                TextButton(
                  child: Text('Sarasa'),
                  onPressed: () {
                    Navigator.pushNamed(context, 'login');
                  },
                ),
                TextButton(
                  child: Text('Alert 1'),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

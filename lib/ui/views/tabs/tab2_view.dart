import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';

import 'package:flutter_base_project/core/viewmodels/tabs/tab2_viewmodel.dart';

class Tab2View extends StatelessWidget {
  Tab2View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<Tab2ViewModel>.reactive(
      viewModelBuilder: () => Tab2ViewModel(),
      builder: (context, vm, child) => Scaffold(
        backgroundColor: Colors.blue,
      ),
    );
  }
}

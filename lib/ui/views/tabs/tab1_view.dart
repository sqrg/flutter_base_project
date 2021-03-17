import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';

import 'package:flutter_base_project/core/viewmodels/tabs/tab1_viewmodel.dart';

class Tab1View extends StatelessWidget {
  Tab1View({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<Tab1ViewModel>.reactive(
      viewModelBuilder: () => Tab1ViewModel(),
      builder: (context, vm, child) => Scaffold(
        backgroundColor: Colors.green,
      ),
    );
  }
}

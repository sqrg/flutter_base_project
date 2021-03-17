import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';

import 'package:flutter_base_project/core/viewmodels/main_viewmodel.dart';

import 'package:flutter_base_project/ui/views/tabs/tab1_view.dart';
import 'package:flutter_base_project/ui/views/tabs/tab2_view.dart';

class MainView extends StatefulWidget {
  static const routeName = 'main';

  @override
  MainViewState createState() => MainViewState();
}

class MainViewState extends State<MainView> with TickerProviderStateMixin {
  TabController tabController;

  var tabsList = [
    Tab1View(),
    Tab2View(),
  ];

  int _currentIndex = 0;

  @override
  void initState() {
    tabController = TabController(
      vsync: this,
      length: tabsList.length,
    );
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  void onTabTapped(int index) {
    setState(() {
      tabController.animateTo(index);
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => MainViewModel(),
      builder: (context, vm, child) => DefaultTabController(
        length: tabsList.length,
        child: Scaffold(
          body: TabBarView(
            // This prevents the user to side-scroll on tabs
            physics: NeverScrollableScrollPhysics(),
            controller: tabController,
            children: tabsList,
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) => onTabTapped(index),
            currentIndex: _currentIndex,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Tab 1'),
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Tab 2'),
            ],
          ),
        ),
      ),
    );
  }
}

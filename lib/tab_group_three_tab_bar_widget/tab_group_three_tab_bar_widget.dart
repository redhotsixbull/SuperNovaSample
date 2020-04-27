/*
*  tab_group_three_tab_bar_widget.dart
*  Spacebook
*
*  Created by Supernova.
*  Copyright © 2018 Supernova. All rights reserved.
    */

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class TabGroupThreeTabBarWidget extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() => _TabGroupThreeTabBarWidgetState();
}


class _TabGroupThreeTabBarWidgetState extends State<TabGroupThreeTabBarWidget> {
  List<Widget> _tabWidgets = [
  ];
  int _currentIndex = 0;
  
  void _onTabChanged(int index) => this.setState(() => _currentIndex = index);
  
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: _tabWidgets[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Color.fromARGB(255, 85, 85, 85),
        currentIndex: _currentIndex,
        onTap: (index) => this._onTabChanged(index),
        items: [
        ],
      ),
    );
  }
}
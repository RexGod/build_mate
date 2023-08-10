// ignore_for_file: constant_identifier_names, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import '../Widgets/appbar.dart';
import 'main-pages/Bill.dart';
import 'main-pages/Costs.dart';

import 'package:ionicons/ionicons.dart';

import 'main-pages/Unit.dart';

class Building extends StatefulWidget {
  Building({super.key});
  static const route_name = '/building_screen';

  @override
  State<Building> createState() => _BuildingState();
}

class _BuildingState extends State<Building> {
  final List<Widget> _pages = const [
    Bill(),
    Unit(),
    Cost(),
  ];
  int _currentIndex = 1;
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          appBarHeight: MediaQuery.of(context).size.height * 0.08,
        ),
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            mouseCursor: SystemMouseCursors.click,
            onTap: onTabTapped,
            currentIndex: _currentIndex,
            enableFeedback: true,
            selectedItemColor: Colors.white,
            unselectedItemColor: const Color.fromRGBO(169, 196, 255, 1),
            backgroundColor: const Color.fromRGBO(64, 123, 255, 1),
            selectedIconTheme: const IconThemeData(opacity: 1),
            unselectedIconTheme: const IconThemeData(opacity: 0.5),
            items: const [
              BottomNavigationBarItem(
                label: 'صورت حساب',
                icon: Icon(
                  Icons.notes,
                  color: Colors.white,
                ),
              ),
              BottomNavigationBarItem(
                label: 'ساکنین',
                icon: Icon(
                  Ionicons.home,
                  color: Colors.white,
                ),
              ),
              BottomNavigationBarItem(
                label: 'هزینه ها',
                icon: Icon(
                  Icons.money,
                  color: Colors.white,
                ),
              )
            ]));
  }
}

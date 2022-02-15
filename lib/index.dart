import 'package:flutter/material.dart';
import 'package:nextwave/components/app_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nextwave/presentation/Screens/send/home.dart';
import 'package:nextwave/presentation/Screens/send/tracking.dart';

class Index extends StatefulWidget {
  const Index({Key? key}) : super(key: key);

  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  //
  int _selectedTab = 0;

  final List<Widget> _tabWidgets = [
    Home(),
    Tracking(),
    Text('tab3'),
    Text('tab4'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarWidget(
        showBell: true,
        showBadge: true,
        badgeContent: '4',
        isShoppingBag: false,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color(0xffFFB7B7),
        backgroundColor: Colors.red,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedTab,
        // i should handle this state with BloC
        onTap: (index) {
          setState(() {
            _selectedTab = index;
          });
        },
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.mapMarker),
            label: 'Tracking',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.list),
            label: const Text(
              'History',
              style: TextStyle(color: Colors.black),
            ).data,
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'Account',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _tabWidgets[_selectedTab],
            ],
          ),
        ),
      ),
    );
  }
}

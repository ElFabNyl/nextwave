import 'package:flutter/material.dart';
import 'package:nextwave/components/app_bar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
          showArrow: false, showBell: true, showBadge: true, badgeContent: '4'),
      body: Column(
        children: [
          const SizedBox(
            height: 50.0,
          ),
         
        ],
      ),
    );
  }
}

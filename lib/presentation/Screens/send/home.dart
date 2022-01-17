import 'package:flutter/material.dart';
import 'package:nextwave/components/home_module_card.dart';
import 'package:nextwave/components/home_welcome_card.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const HomeWelcomeCard(
            welcomeText: 'welcome',
            userName: 'Rihanna Fenty',
            imagePath: 'assets/images/moto.png'),
        const SizedBox(height: 40.0),
        HomeModuleCard(
            action: () {
              Navigator.of(context).pushNamed('/package_description');
              
            },
            imagePath: 'assets/images/send.png',
            moduleName: 'Peer to peer Sending',
            moduleDescription: 'Send a parcel anywhere at any time'),
        const SizedBox(height: 30.0),
        HomeModuleCard(
            action: () {},
            imagePath: 'assets/images/food.png',
            moduleName: 'Order Food',
            moduleDescription: 'Order food from your favorite restaurants'),
        const SizedBox(height: 30.0),
        HomeModuleCard(
            action: () {},
            imagePath: 'assets/images/shop.png',
            moduleName: 'Shop',
            moduleDescription: 'purchase items and get delivered'),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:nextwave/components/home_module_card.dart';
import 'package:nextwave/components/home_welcome_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<String> _name;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _name = _prefs.then((SharedPreferences prefs) {
      return prefs.getString('name') ?? '';
    });
  }     

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HomeWelcomeCard(
            welcomeText: 'welcome',
            userName: FutureBuilder<String>(
                future: _name,
                builder:
                    (BuildContext context, AsyncSnapshot<String> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return const CircularProgressIndicator();
                    default:
                      if (snapshot.hasError) {
                        return const Text('');
                      } else {
                        return Text(
                          '${snapshot.data}',
                          style: const TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 23.0),
                        );
                      }
                  }
                }),
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

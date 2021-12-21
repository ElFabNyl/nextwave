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
      backgroundColor: Colors.white,
      appBar: AppBarWidget(
        showArrow: false,
        showBell: false,
        showBadge: true,
        badgeContent: '4',
        isShoppingBag: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {},
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Card(
                  elevation: 6.0,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: MediaQuery.of(context).size.height * 0.25,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0)),
                      child: GridTile(
                        footer: Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Heal sandals',
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16.0),
                                ),
                                Text(
                                  '20,000 FCFA',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 20.0),
                                ),
                              ],
                            ),
                          ),
                        ),
                        child: Image.asset('assets/images/shoes.png',
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

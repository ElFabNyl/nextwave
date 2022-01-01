import 'package:flutter/material.dart';
import 'package:nextwave/components/app_bar.dart';
import 'package:nextwave/components/elevated_button.dart';

class Confirmation extends StatefulWidget {
  const Confirmation({Key? key}) : super(key: key);

  @override
  _ConfirmationState createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        isShoppingBag: false,
        showArrow: true,
        showBell: false,
        showBadge: false,
        title: Text('Confirmation'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: double.infinity,
                  child: Image.asset('assets/images/success.png'),
                ),
                const SizedBox(height: 12.0),
                const Text(
                  'Transaction successful',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w900),
                ),
                const SizedBox(height: 10.0),
                const Text(
                  'Stay available by phone, an agent is on his way to your pickup position to take the parcel',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                const SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text('Extimated time : '),
                    Text(
                      '20 mins',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.w900),
                    )
                  ],
                ),
                const SizedBox(height: 30.0),
                DefaultElevatedButton(
                    text: const Text('See tracking'),
                    showArrowBack: false,
                    showArrowFoward: false,
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('/tracking');
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

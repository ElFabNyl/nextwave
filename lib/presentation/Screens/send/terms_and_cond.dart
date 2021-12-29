import 'package:flutter/material.dart';
import 'package:nextwave/components/app_bar.dart';
import 'package:nextwave/components/elevated_button.dart';

class TermsAndConditions2 extends StatefulWidget {
  const TermsAndConditions2({Key? key}) : super(key: key);

  @override
  _TermsAndConditions2State createState() => _TermsAndConditions2State();
}

class _TermsAndConditions2State extends State<TermsAndConditions2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        isShoppingBag: false,
        showArrow: true,
        showBell: false,
        showBadge: false,
        title: Text(
          'Policies and terms of service',
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: double.infinity,
                  child: Image.asset('assets/images/gift.png'),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: const Text(
                    'By proceeding to payment you confirm that  the reciever will be available to recieve the parcel unfailingly',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                const SizedBox(height: 40.0),
                Column(
                  children: [
                    DefaultElevatedButton(
                        text: const Text('Proceed'),
                        showArrowBack: false,
                        showArrowFoward: true,
                        onPressed: () {
                          Navigator.of(context).pushNamed('/billing');
                        }),
                    TextButton(
                      onPressed: () {},
                      child: TextButton(
                        child: const Text(
                          'Back',
                          style: TextStyle(
                              color: Color(0xff0C4CC9),
                              fontWeight: FontWeight.w700),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

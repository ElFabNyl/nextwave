import 'package:flutter/material.dart';
import 'package:nextwave/components/app_bar.dart';
import 'package:nextwave/components/payment_method_card.dart';

class BillingScreen extends StatefulWidget {
  const BillingScreen({Key? key}) : super(key: key);

  @override
  _BillingScreenState createState() => _BillingScreenState();
}

class _BillingScreenState extends State<BillingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        isShoppingBag: false,
        showArrow: true,
        showBell: false,
        showBadge: false,
        title: Text('Billing'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
          child: Column(
            children: [
              PaymentMethodCard(
                  imagePath: 'assets/images/MoMo.png',
                  description: 'Pay with MTN Mobile money',
                  onTap: () {
                    //do something here   |There will be some steps before the navigation to the other screen
                  }),
              const SizedBox(height: 17.0),
              PaymentMethodCard(
                  imagePath: 'assets/images/OM.png',
                  description: 'Pay with Orange Money',
                  onTap: () {
                    //do something here
                  }),
              const SizedBox(height: 17.0),
              PaymentMethodCard(
                  imagePath: 'assets/images/send.png',
                  description: 'Use voucher',
                  onTap: () {
                    //do something here
                  })
            ],
          ),
        ),
      ),
    );
  }
}

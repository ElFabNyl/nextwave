import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nextwave/components/app_bar.dart';
import 'package:nextwave/components/elevated_button.dart';
import 'package:nextwave/components/text_field.dart';

class Address extends StatefulWidget {
  const Address({Key? key}) : super(key: key);

  @override
  _AddressState createState() => _AddressState();
}

class _AddressState extends State<Address> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        isShoppingBag: false,
        showBell: false,
        showBadge: false,
        title: Text('Send Parcel'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Addresses',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 22.0),
                ),
                const SizedBox(height: 30.0),
                const InputFormFieldWidget(
                  hintText: 'Enter the pickup address',
                  prefixIcon:
                      Icon(FontAwesomeIcons.mapMarker, color: Colors.grey),
                ),
                const SizedBox(height: 20.0),
                const InputFormFieldWidget(
                  hintText: 'Enter destination address',
                  prefixIcon:
                      Icon(FontAwesomeIcons.mapMarker, color: Colors.grey),
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Detect my location',
                          style: TextStyle(
                              color: Color(0xff034AB4) , fontWeight: FontWeight.w800),
                        ))
                  ],
                ),
                const SizedBox(height: 10.0),
                const Divider(color: Colors.grey),
                const SizedBox(height: 10.0),
                const InputFormFieldWidget(
                  hintText: 'Sender’s name',
                  prefixIcon: Icon(Icons.person, color: Colors.grey),
                ),
                const SizedBox(height: 20.0),
                const InputFormFieldWidget(
                  hintText: 'Sender’s phone number',
                  prefixIcon: Icon(Icons.phone, color: Colors.grey),
                ),
                const SizedBox(height: 20.0),
                const InputFormFieldWidget(
                  hintText: 'Receiver’s name',
                  prefixIcon: Icon(Icons.person, color: Colors.grey),
                ),
                const SizedBox(height: 20.0),
                const InputFormFieldWidget(
                  hintText: 'Receiver’s phone number',
                  prefixIcon: Icon(Icons.phone, color: Colors.grey),
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DefaultElevatedButton(
                        text: const Text('Back'),
                        showArrowBack: true,
                        showArrowFoward: false,
                        onPressed: () {
                          Navigator.of(context).pop();
                        }),
                    DefaultElevatedButton(
                        text: const Text('Proceed'),
                        showArrowBack: false,
                        showArrowFoward: true,
                        onPressed: () {
                          Navigator.of(context).pushNamed('/delivery_details');
                        })
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
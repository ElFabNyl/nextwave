import 'package:flutter/material.dart';
import 'package:nextwave/components/app_bar.dart';
import 'package:nextwave/components/elevated_button.dart';
import 'package:nextwave/components/text_field.dart';

class PackageDescription extends StatefulWidget {
  const PackageDescription({Key? key}) : super(key: key);

  @override
  _PackageDescriptionState createState() => _PackageDescriptionState();
}

class _PackageDescriptionState extends State<PackageDescription> {
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Describe the package',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 22.0),
                ),
                const SizedBox(height: 30.0),
                const InputFormFieldWidget(hintText: 'Describe the package'),
                const SizedBox(height: 15.0),
                const Divider(color: Colors.grey),
                const SizedBox(height: 15.0),
                Row(
                  children: [
                    const Text(
                      'Dimenssion',
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 17.0),
                    ),
                    const SizedBox(width: 8.0),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Image.asset('assets/images/cube.png'),
                                elevation: 4.0,
                                actions: [
                                  Positioned(
                                    top: 60.0,
                                    child: TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text(
                                          'Close',
                                          style: TextStyle(color: Colors.grey),
                                        )),
                                  )
                                ],
                              );
                            });
                      },
                      child: Image.asset('assets/images/question.png'),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                const InputFormFieldWidget(hintText: 'Enter Lenght in cm'),
                const SizedBox(height: 20.0),
                const InputFormFieldWidget(hintText: 'Enter width in cm'),
                const SizedBox(height: 20.0),
                const InputFormFieldWidget(hintText: 'Enter Height in cm'),
                const SizedBox(height: 20.0),
                const InputFormFieldWidget(hintText: 'Enter weight in grams'),
                SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    DefaultElevatedButton(
                        text: const Text('Proceed'),
                        showArrowBack: false,
                        showArrowFoward: true,
                        onPressed: () {
                          Navigator.of(context).pushNamed('/address_infos');
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

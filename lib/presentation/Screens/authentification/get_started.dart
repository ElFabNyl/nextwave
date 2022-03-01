import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nextwave/components/elevated_button.dart';
import 'package:nextwave/index.dart';
import 'package:nextwave/models/user.dart';
import 'package:nextwave/presentation/Screens/no_data.dart';

class GetStarted extends StatefulWidget {
  final User incominguserRegistered;
  const GetStarted({
    Key? key,
    required this.incominguserRegistered,
  }) : super(key: key);

  @override
  _GetStartedState createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Get started',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 45.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/images/start.png'),
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                'Your account has been created successfuly. Welcome on board',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 10.0,
              ),

              //
              //
              Text(
                widget.incominguserRegistered.userName,
                style: const TextStyle(
                    fontWeight: FontWeight.w800, fontSize: 20.0),
              ),
              const SizedBox(
                height: 40.0,
              ),
              DefaultElevatedButton(
                text: const Text('Get Started'),
                showArrowBack: false,
                showArrowFoward: false,
                onPressed: () {
                  //he has to go to the next page with his name and the token
                  // Navigator.of(context).pushAndRemoveUntil(
                  //     MaterialPageRoute(
                  //         builder: (BuildContext context) => const Index()),
                  //     (route) => false);

                  Get.offAll(()=>const NoData());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

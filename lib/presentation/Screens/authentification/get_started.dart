import 'package:flutter/material.dart';
import 'package:nextwave/components/elevated_button.dart';
import 'package:nextwave/index.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({Key? key}) : super(key: key);

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
                'Your account has been created successfuly. welcome on board',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                'Rihanna Fenty',
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20.0),
              ),
              const SizedBox(
                height: 40.0,
              ),
              DefaultElevatedButton(
                  text: const Text('Get Started'),
                  showArrowBack: false,
                  showArrowFoward: false,
                  onPressed: () {
                    //
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (BuildContext context) => const Index()),
                        (route) => false);
                  })
            ],
          ),
        ),
      ),
    );
  }
}

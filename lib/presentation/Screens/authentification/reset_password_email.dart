import 'package:flutter/material.dart';
import 'package:nextwave/components/elevated_button.dart';
import 'package:nextwave/components/text_field.dart';

class ResetPasswordScreen1 extends StatefulWidget {
  const ResetPasswordScreen1({Key? key}) : super(key: key);

  @override
  _ResetPasswordScreen1State createState() => _ResetPasswordScreen1State();
}

class _ResetPasswordScreen1State extends State<ResetPasswordScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Password Reset',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 50),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 200.0,
                width: 200.0,
                child: Image.asset('assets/images/email.png'),
              ),
              const SizedBox(height: 15.0),
              const InputFormFieldWidget(
                  hintText: 'Enter your registration  email'),
              const SizedBox(height: 20.0),
              DefaultElevatedButton(
                  text: const Text('Proceed'),
                  showArrowBack: false,
                  showArrowFoward: false,
                  onPressed: () {
                    //
                    Navigator.of(context).pushNamed('/resetPassword2');
                  })
            ],
          ),
        ),
      ),
    );
  }
}

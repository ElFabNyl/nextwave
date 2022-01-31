import 'package:flutter/material.dart';
import 'package:nextwave/components/elevated_button.dart';
import 'package:nextwave/components/text_field.dart';

class OTPVerification extends StatefulWidget {
  const OTPVerification({Key? key}) : super(key: key);

  @override
  _OTPVerificationState createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Phone',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 40.0),
            child: Column(
              children: [
                const Text(
                  'OTP verification code',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 19.0),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Text(
                  'An sms will sent to your phone with an OTP code to verify your phone number',
                  style: TextStyle(color: Colors.grey),
                ),
                const InputFormFieldWidget(hintText: 'Enter the OTP Code'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text(
                      '00:30',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                const SizedBox(height: 20.0),
                DefaultElevatedButton(
                    text: const Text('Proceed'),
                    showArrowBack: false,
                    showArrowFoward: false,
                    onPressed: () {
                      //
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

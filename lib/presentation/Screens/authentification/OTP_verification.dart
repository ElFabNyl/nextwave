import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timer_count_down/timer_count_down.dart';

import 'package:nextwave/components/elevated_button.dart';
import 'package:nextwave/components/text_field.dart';
import 'package:nextwave/presentation/Screens/authentification/terms_policy.dart';

class OTPVerification extends StatefulWidget {
  final String incomingEmail;
  final String incomingPassword;
  final String incomingName;
  final String incomingPhone;
  final String incomingverificationID;
  const OTPVerification({
    Key? key,
    required this.incomingEmail,
    required this.incomingPassword,
    required this.incomingName,
    required this.incomingPhone,
    required this.incomingverificationID,
  }) : super(key: key);

  @override
  _OTPVerificationState createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  //
  final _formkey = GlobalKey<FormState>();
  //
  String codeOTP = "";
  //
  bool showLoading = false;
  //
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final String email = widget.incomingEmail;
    final String password = widget.incomingPassword;
    final String name = widget.incomingName;
    final String phone = widget.incomingPhone;
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
            child: Form(
              key: _formkey,
              child: showLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: Colors.red,
                    ))
                  : Column(
                      children: [
                        const Text(
                          'OTP verification code',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 22.0),
                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
                        const Text(
                          'An sms will be send to you with an OTP code to verify your phone number',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.0),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        InputFormFieldWidget(
                          isnumberInput: true,
                          isEmailInput: false,
                          hintText: 'Enter the OTP Code',
                          onChanged: (inputOTP) {
                            //
                            setState(() {
                              codeOTP = inputOTP;
                            });
                          },
                          checkInput: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Invalid Code';
                            }
                          },
                        ),
                        const SizedBox(height: 5.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Countdown(
                              seconds: 90,
                              build: (BuildContext context, double time) =>
                                  Text(
                                time.toString(),
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w900),
                              ),
                              interval: const Duration(milliseconds: 100),
                              onFinished: () {
                                //if the time ends without him filling the input, we tell him that
                                //the time is over and send him back

                                Get.snackbar("NEXTWAVE XPRESS NOTIFICATION",
                                    "Time out !  Try later",
                                    icon: const Icon(Icons.error,
                                        color: Colors.red),
                                    snackPosition: SnackPosition.TOP,
                                    duration: const Duration(seconds: 7));
                                Navigator.of(context).pop();
                              },
                            )
                          ],
                        ),
                        const SizedBox(height: 50.0),
                        DefaultElevatedButton(
                            text: const Text('Verify'),
                            showArrowBack: false,
                            showArrowFoward: false,
                            onPressed: () async {
                              // on check l'otp
                              if (_formkey.currentState!.validate()) {
                                setState(() {
                                  showLoading = true;
                                });
                                try {
                                  PhoneAuthCredential phoneAuthCredential =
                                      PhoneAuthProvider.credential(
                                          verificationId:
                                              widget.incomingverificationID,
                                          smsCode: codeOTP);
                                  await _auth.signInWithCredential(
                                      phoneAuthCredential);
                                  setState(() {
                                    showLoading = false;
                                  });
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              TermsAndPolicy(
                                                  incomingEmail: email,
                                                  incomingPassword: password,
                                                  incomingName: name,
                                                  incomingPhone: phone)),
                                      (route) => false);
                                } on FirebaseAuthException catch (e) {
                                  Get.snackbar("NEXTWAVE XPRESS NOTIFICATION",
                                      e.message.toString(),
                                      icon: const Icon(Icons.error,
                                          color: Colors.red),
                                      snackPosition: SnackPosition.BOTTOM,
                                      duration: const Duration(seconds: 6));

                                  Navigator.pop(context);
                                }
                              }
                            })
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

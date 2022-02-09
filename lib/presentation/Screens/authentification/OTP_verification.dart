import 'package:flutter/material.dart';
import 'package:nextwave/presentation/Screens/authentification/terms_policy.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/tap_bounce_container.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import 'package:nextwave/components/elevated_button.dart';
import 'package:nextwave/components/text_field.dart';

class OTPVerification extends StatefulWidget {
  final String incomingEmail;
  final String incomingPassword;
  final String incomingName;
  final String incomingPhone;
  const OTPVerification({
    Key? key,
    required this.incomingEmail,
    required this.incomingPassword,
    required this.incomingName,
    required this.incomingPhone,
  }) : super(key: key);

  @override
  _OTPVerificationState createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  final _formkey = GlobalKey<FormState>();
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
              child: Column(
                children: [
                  const Text(
                    'OTP verification code',
                    style:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 22.0),
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
                    hintText: 'Enter the OTP Code',
                    onChanged: (inputOTP) {
                      //ici je fais faire les verifications de l'OTP envoyé par firebase.
                    },
                    checkInput: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Invalid input';
                      }
                    },
                  ),
                  const SizedBox(height: 5.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Countdown(
                        seconds: 30,
                        build: (BuildContext context, double time) => Text(
                            time.toString(),
                            style: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w900)),
                        interval: const Duration(milliseconds: 100),
                        onFinished: () {
                          //if the time ends without him filling the input, we tell him that the time is over and send him back

                          showTopSnackBar(
                            context,
                            const CustomSnackBar.error(
                              message: "Waiting time expired... ",
                            ),
                          );
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  ),
                  const SizedBox(height: 50.0),
                  DefaultElevatedButton(
                      text: const Text('Proceed'),
                      showArrowBack: false,
                      showArrowFoward: false,
                      onPressed: () {
                        //avant d'avancer, on doit se rassurer que l'otp est valide.

                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    TermsAndPolicy(
                                        incomingEmail: email,
                                        incomingPassword: password,
                                        incomingName: name,
                                        incomingPhone: phone)),
                            (route) => false);
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

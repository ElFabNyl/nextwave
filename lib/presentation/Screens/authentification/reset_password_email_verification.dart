import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:nextwave/components/elevated_button.dart';
import 'package:nextwave/components/text_field.dart';
import 'package:nextwave/presentation/Screens/authentification/reset_password_new_password.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timer_count_down/timer_count_down.dart';

import '../../../services/api_service_auth.dart';
import 'reset_password_email.dart';

class ResetPasswordScreen2 extends StatefulWidget {
  final String incomingEmail;
  const ResetPasswordScreen2({
    Key? key,
    required this.incomingEmail,
  }) : super(key: key);

  @override
  _ResetPasswordScreen2State createState() => _ResetPasswordScreen2State();
}

class _ResetPasswordScreen2State extends State<ResetPasswordScreen2> {
  //
  bool showLoading = false;
  // Create a global key that uniquely identifies the Form widget
  final _formKey = GlobalKey<FormState>();
  //
  String otpCode = '';
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Password Reset',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 40.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Text(
                    'PASSWORD RESET',
                    style:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 22.0),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  const Text(
                    'Please check your emails and fill the input bellow',
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
                    isEmailInput: false,
                    isnumberInput: true,
                      onChanged: (otp) {
                        setState(() {
                          otpCode = otp;
                        });
                      },
                      checkInput: (value) {
                        if (value == null ||
                            value.isEmpty ) {
                          return 'Invalid input';
                        }
                        return null;
                      },
                      hintText: 'Enter the  code received '),
                  const SizedBox(height: 5.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Countdown(
                        seconds: 60,
                        build: (BuildContext context, double time) => Text(
                            time.toString(),
                            style: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w900)),
                        interval: const Duration(milliseconds: 100),
                        onFinished: () {
                          //if the time ends without him filling the input, we tell him that
                          //the time is over and send him back

                          Get.snackbar("NEXTWAVE XPRESS NOTIFICATION",
                              "Time out !  Try later",
                              icon: const Icon(Icons.error, color: Colors.red),
                              snackPosition: SnackPosition.BOTTOM,
                              duration: const Duration(seconds: 7));
                          Get.offAll(const ResetPasswordScreen1());
                        },
                      )
                    ],
                  ),
                  const SizedBox(height: 50.0),
                  DefaultElevatedButton(
                      text: const Text('Proceed'),
                      showArrowBack: false,
                      showArrowFoward: false,
                      onPressed: () async {
                        //
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            showLoading = true;
                          });

                          await AuthentificationApiService
                              .verifyOtpSendedByEmail(
                                  widget.incomingEmail, otpCode);
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          if (prefs.getBool('status') == false) {
                            prefs.remove('status');
                            setState(() {
                              showLoading = false;
                            });
                            Get.offAll(() => const ResetPasswordScreen1());
                          } else {
                            setState(() {
                              showLoading = false;
                            });
                            Get.offAll(() =>  NewPassword(incomingEmail: widget.incomingEmail));
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

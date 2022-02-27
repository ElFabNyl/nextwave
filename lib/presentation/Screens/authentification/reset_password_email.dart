import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nextwave/components/elevated_button.dart';
import 'package:nextwave/components/text_field.dart';
import 'package:nextwave/presentation/Screens/authentification/reset_password_email_verification.dart';
import 'package:nextwave/services/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../services/email_validation_service.dart';

class ResetPasswordScreen1 extends StatefulWidget {
  const ResetPasswordScreen1({Key? key}) : super(key: key);

  @override
  _ResetPasswordScreen1State createState() => _ResetPasswordScreen1State();
}

class _ResetPasswordScreen1State extends State<ResetPasswordScreen1> {
  // Create a global key that uniquely identifies the Form widget
  final _formKey = GlobalKey<FormState>();
  //
  bool showLoading = false;
  //
  String email = '';
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
      body: showLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 50),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 200.0,
                          width: 200.0,
                          child: Image.asset('assets/images/email.png'),
                        ),
                        const SizedBox(height: 15.0),
                        InputFormFieldWidget(
                          hintText: 'Enter your registration  email',
                          onChanged: (input) {
                            setState(() {
                              email = input;
                            });
                          },
                          checkInput: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                !EmailValidation.validateEmail(value)) {
                              return 'Enter a correct email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20.0),
                        DefaultElevatedButton(
                            text: const Text('Proceed'),
                            showArrowBack: false,
                            showArrowFoward: false,
                            onPressed: () async {
                              //
                              if (_formKey.currentState!.validate()) {
                                //
                                setState(() {
                                  showLoading = true;
                                });
                                await Api.verifyEmail(email);
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                if (prefs.getBool('status') == false) {
                                  prefs.remove('status');
                                  setState(() {
                                    showLoading = false;
                                  });
                                  Get.offAll(
                                      () => const ResetPasswordScreen1());
                                } else {
                                  setState(() {
                                    showLoading = false;
                                  });
                                  Get.offAll(
                                      () => const ResetPasswordScreen2());
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

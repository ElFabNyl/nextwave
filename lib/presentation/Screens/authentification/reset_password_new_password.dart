import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:nextwave/components/elevated_button.dart';
import 'package:nextwave/components/text_field.dart';
import 'package:nextwave/services/api_service_auth.dart';

import 'auth_index.dart';
import 'reset_password_email.dart';

class NewPassword extends StatefulWidget {
  final String incomingEmail;
  const NewPassword({
    Key? key,
    required this.incomingEmail,
  }) : super(key: key);

  @override
  _NewPasswordState createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  // Create a global key that uniquely identifies the Form widget
  final _formKey = GlobalKey<FormState>();
  //
  bool showLoading = false;
  //
  String password = '';
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
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 80),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 15.0),
               
                        InputFormFieldWidget(
                          hintText: 'Enter your new password',
                          obscureText: true,
                          onChanged: (input) {
                            setState(() {
                              password = input;
                            });
                          },
                          checkInput: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Incorrect input';
                            } else if (value.length < 8) {
                              return '8 digit password is required';
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
                                setState(() {
                                  showLoading = true;
                                });

                                await AuthentificationApiService.resetPassword(
                                    widget.incomingEmail, password);

                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                if (prefs.getBool('status') == false) {
                                  prefs.remove('status');
                                  Get.offAll(
                                      () => const ResetPasswordScreen1());
                                } else {
                                  Get.offAll(() =>
                                      const AuthentificationIndexScreen());
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

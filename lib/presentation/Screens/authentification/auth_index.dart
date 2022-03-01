import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nextwave/components/elevated_button.dart';
import 'package:nextwave/components/text_field.dart';
import 'package:nextwave/index.dart';
import 'package:nextwave/services/api_service_auth.dart';
import 'package:nextwave/services/email_validation_service.dart';
import 'package:nextwave/services/google_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../no_data.dart';

class AuthentificationIndexScreen extends StatefulWidget {
  const AuthentificationIndexScreen({Key? key}) : super(key: key);

  @override
  _AuthentificationIndexScreenState createState() =>
      _AuthentificationIndexScreenState();
}

class _AuthentificationIndexScreenState
    extends State<AuthentificationIndexScreen> {
  //
  bool obscurePassword = true;
  //
  bool showLoading = false;

  //
  String email = '';
  //
  String password = '';

  // Create a global key that uniquely identifies the Form widget
  final _formKey = GlobalKey<FormState>();
  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: showLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 50.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.0),
                          child: Text(
                            'Authentification',
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w500),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        ElevatedButton(
                          onPressed: () async {
                            setState(() {
                              showLoading = true;
                            });
                            //an action should be performed here

                            await GoogleAuth.signInWithGoogle();
                            setState(() {
                              showLoading = false;
                            });

                            // Get.off(() => const Index());
                            Get.offAll(() => const NoData());
                          },
                          style: ButtonStyle(
                            padding:
                                MaterialStateProperty.all<EdgeInsetsGeometry>(
                              const EdgeInsets.all(15),
                            ),
                            elevation: MaterialStateProperty.all(0),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all(
                              const Color(0xffECF1FE),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/google.png'),
                              const Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text(
                                  'Connect with Google',
                                  style: TextStyle(
                                      color: Color(0xff646C83), fontSize: 17.0),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              '----------- or -----------',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        InputFormFieldWidget(
                          onChanged: (inputEmail) {
                            setState(() {
                              email = inputEmail;
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
                          prefixIcon: const Icon(
                            Icons.email,
                            color: Colors.grey,
                          ),
                          hintText: 'Email address',
                        ),
                        const SizedBox(height: 10.0),
                        InputFormFieldWidget(
                          onChanged: (inputPwd) {
                            setState(() {
                              password = inputPwd;
                            });
                          },
                          checkInput: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Incorrect input';
                            } else if (value.length < 8) {
                              return 'A 8 digits password is required';
                            }
                            return null;
                          },
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Colors.grey,
                          ),
                          hintText: 'Password',
                          obscureText: obscurePassword,
                          suffixIcon: IconButton(
                              onPressed: () {
                                //
                                setState(() {
                                  obscurePassword = false;
                                });
                              },
                              icon: const Icon(
                                Icons.remove_red_eye,
                                color: Colors.grey,
                              )),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                                onPressed: () {
                                  //
                                  Navigator.of(context)
                                      .pushNamed('/resetPassword1');
                                },
                                child: const Text(
                                  'Forgot password?',
                                  style: TextStyle(
                                      color: Color(0xff1960CC),
                                      fontWeight: FontWeight.w500),
                                ))
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        DefaultElevatedButton(
                            text: const Text(
                              'Sign in',
                              style: TextStyle(fontSize: 17.0),
                            ),
                            showArrowBack: false,
                            showArrowFoward: false,
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                //
                                setState(() {
                                  showLoading = true;
                                });
                                await AuthentificationApiService.login(
                                    email, password);

                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                if (prefs.getBool('status') == false) {
                                  prefs.remove('status');
                                  setState(() {
                                    showLoading = false;
                                  });
                                  Get.offAll(() =>
                                      const AuthentificationIndexScreen());
                                } else {
                                  setState(() {
                                    showLoading = false;
                                  });

                                  // Get.offAll(() => const Index());
                                  Get.offAll(() => const NoData());
                                }
                              }
                            }),
                        const SizedBox(height: 15.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Don’t have an account yet?',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16.0),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed('/sign_up');
                              },
                              child: const Text(
                                'Signup',
                                style: TextStyle(color: Color(0xff1960CC)),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}

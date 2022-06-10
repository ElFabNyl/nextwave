import 'package:flutter/material.dart';
import 'package:nextwave/components/elevated_button.dart';
import 'package:nextwave/components/text_field.dart';
import 'package:nextwave/presentation/Screens/authentification/user_infos.dart';
import 'package:nextwave/services/email_validation_service.dart';

import 'package:lottie/lottie.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String inputEmail = "";
  String inputPassword = "";

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 50.0),
          child: Form(
            key: _formkey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 40.0),
                    child: Text(
                      'Authentification',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.2),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  SizedBox(
                    width: double.infinity,
                    height: 150,
                    child: Lottie.asset('assets/animations/driver.json'),
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
                    isEmailInput: true,
                    isnumberInput: false,
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Colors.grey,
                    ),
                    hintText: 'Email address',
                    onChanged: (input) {
                      setState(() {
                        inputEmail = input;
                      });
                    },
                    checkInput: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !EmailValidation.validateEmail(value)) {
                        return 'Invalid email';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 10.0),
                  InputFormFieldWidget(
                    isnumberInput: false,
                    isEmailInput: false,
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Colors.grey,
                    ),
                    obscureText: true,
                    hintText: 'Password',
                    onChanged: (input) {
                      setState(() {
                        inputPassword = input;
                      });
                    },
                    checkInput: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Invalid input';
                      } else if (value.length < 8) {
                        return 'A 8 digits password is required';
                      }

                      return null;
                    },
                    suffixIcon: IconButton(
                        onPressed: () {
                          //
                        },
                        icon: const Icon(
                          Icons.remove_red_eye,
                          color: Colors.grey,
                        )),
                  ),
                  const SizedBox(height: 10.0),
                  DefaultElevatedButton(
                      text: const Text(
                        'Sign up',
                        style: TextStyle(fontSize: 17.0),
                      ),
                      showArrowBack: false,
                      showArrowFoward: false,
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return SignUpUserInfos(inputEmail, inputPassword);
                          }));
                        }
                      }),
                  const SizedBox(height: 15.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:nextwave/components/elevated_button.dart';
import 'package:nextwave/components/text_field.dart';
import 'package:nextwave/presentation/Screens/authentification/OTP_verification.dart';

class SignUpUserInfos extends StatefulWidget {
  final String incomingEmail;
  final String incomingPassword;

  const SignUpUserInfos(
    this.incomingEmail,
    this.incomingPassword,
  );

  @override
  _SignUpUserInfosState createState() => _SignUpUserInfosState();
}

class _SignUpUserInfosState extends State<SignUpUserInfos> {
  String inputName = '';
  String inputPhone = '';

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final String inputEmail = widget.incomingEmail;
    final String inputPassword = widget.incomingPassword;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'User info',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 50.0),
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  Image.asset('assets/images/user_infos.png'),
                  const SizedBox(height: 20.0),
                  InputFormFieldWidget(
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                    onChanged: (input) {
                      setState(() {
                        inputName = input;
                      });
                    },
                    checkInput: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Invalid input';
                      }
                      return null;
                    },
                    hintText: 'Username',
                  ),
                  const SizedBox(height: 20.0),
                  InputFormFieldWidget(
                    prefixIcon: const Icon(
                      Icons.phone,
                      color: Colors.grey,
                    ),
                    onChanged: (input) {
                      setState(() {
                        inputPhone = input;
                      });
                    },
                    checkInput: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Invalid input';
                      } else if (value.length < 12) {
                        return 'incorrect phone number, consider adding 237';
                      }
                      return null;
                    },
                    hintText: 'Phone number',
                  ),
                  const SizedBox(height: 20.0),
                  DefaultElevatedButton(
                      text: const Text('Proceed'),
                      showArrowBack: false,
                      showArrowFoward: false,
                      onPressed: () {
                        //
                        if (_formkey.currentState!.validate()) {
                          //avant de Naviger vers la prochaine page, je dois demander à firebase d'envoyer l'otp au numero recu.

                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return OTPVerification(
                                incomingEmail: inputEmail,
                                incomingPassword: inputPassword,
                                incomingName: inputName,
                                incomingPhone: inputPhone);
                          }));
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

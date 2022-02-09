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
  @override
  void initState() {
    super.initState();
    print(widget.incomingEmail);
    print(widget.incomingPassword);
  }

  @override
  Widget build(BuildContext context) {
    final String inputEmail = widget.incomingEmail;
    final String inputPassword = widget.incomingPassword;
    final String inputName = '';
    final String inputPhone = '';

    final _formkey = GlobalKey<FormState>();

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
                    onChanged: (inputName) {
                      setState(() {
                        inputName = inputName;
                      });
                    },
                    checkInput: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Invalid input';
                      }
                    },
                    hintText: 'Username',
                  ),
                  const SizedBox(height: 20.0),
                  InputFormFieldWidget(
                    prefixIcon: const Icon(
                      Icons.phone,
                      color: Colors.grey,
                    ),
                    onChanged: (inputPhone) {
                      setState(() {
                        inputPhone = inputPhone;
                      });
                    },
                    checkInput: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Invalid input';
                      } else if (value.length < 12) {
                        return 'incorrect phone number, consider adding 237';
                      }
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

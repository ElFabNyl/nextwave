import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

import 'package:nextwave/components/elevated_button.dart';
import 'package:nextwave/components/text_field.dart';
import 'package:nextwave/presentation/Screens/authentification/OTP_verification.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

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
  String verificationID = '';
  //
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //
  bool showLoading = false;
  //

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final String inputEmail = widget.incomingEmail;
    final String inputPassword = widget.incomingPassword;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'User infos',
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
              child: showLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: Colors.red,
                    ))
                  : Column(
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
                              inputPhone = '+237' + input;
                            });
                          },
                          checkInput: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Invalid input';
                            } else if (value.length < 12) {
                              return 'incorrect phone number';
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
                            onPressed: () async {
                              //
                              setState(() {
                                showLoading = true;
                              });
                              //avant d'avancer, on doit se rassurer d'envoyer l'otp.
                              //we create the phone auth credential
                              //==============================================================================
                              await _auth.verifyPhoneNumber(
                                  phoneNumber: inputPhone,
                                  verificationCompleted:
                                      (PhoneAuthCredential credential) async {
                                    setState(() {
                                      showLoading = false;
                                    });
                                    // ANDROID ONLY!

                                    // Sign the user in (or link) with the auto-generated credential
                                    await _auth
                                        .signInWithCredential(credential);
                                  },
                                  verificationFailed: (FirebaseAuthException
                                      verificationFailed) async {
                                    //
                                    showTopSnackBar(
                                      context,
                                      CustomSnackBar.error(
                                        message: verificationFailed.message
                                            .toString(),
                                      ),
                                    );
                                    setState(() {
                                      showLoading = false;
                                    });
                                  },
                                  codeSent: (String verificationId,
                                      int? resendToken) async {
                                    setState(() {
                                      showLoading = false;
                                      verificationID = verificationId;
                                    });
                                    

                                    if (_formkey.currentState!.validate()) {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return OTPVerification(
                                          incomingEmail: inputEmail,
                                          incomingPassword: inputPassword,
                                          incomingName: inputName,
                                          incomingPhone: inputPhone,
                                          incomingverificationID:
                                              verificationID,
                                        );
                                      }));
                                    }
                                  },
                                  codeAutoRetrievalTimeout:
                                      (String verificationId) async {
                                    //
                                    setState(() {
                                      showLoading = false;
                                    });
                                  });
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

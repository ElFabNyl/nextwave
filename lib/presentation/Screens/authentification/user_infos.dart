import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
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
  //connexion avec firebase
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
                          isEmailInput: false,
                          isnumberInput: false,
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
                          isEmailInput: false,
                          isnumberInput: false,
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
                            } else if (value.length < 9) {
                              return 'incorrect phone number';
                            }else if (value.length>14){
                              return 'invalid number, consider removing the country code';

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

                              //avant d'avancer, on doit se rassurer d'envoyer l'otp.
                              //we create the phone auth credential
                              //==============================================================================
                              if (_formkey.currentState!.validate()) {
                                //
                                setState(() {
                                  showLoading = true;
                                });
                                await _auth.verifyPhoneNumber(
                                    phoneNumber: inputPhone,
                                    timeout: const Duration(seconds: 90),
                                    verificationCompleted:
                                        (PhoneAuthCredential credential) async {
                                      setState(() {
                                        showLoading = false;
                                      });
                                      // ANDROID ONLY!

                                      // Sign the user in (or link) with the auto-generated credential
                                      await _auth
                                          .signInWithCredential(credential)
                                          .then((value) async {
                                        CupertinoAlertDialog(
                                          title: const Text(
                                              'Phone Authentification'),
                                          content: const Text(
                                              'Phone number verified'),
                                          actions: [
                                            CupertinoButton(
                                              child: const Text('Close'),
                                              onPressed: () {
                                                Navigator.pushAndRemoveUntil(
                                                    context, MaterialPageRoute(
                                                        builder: (context) {
                                                  return OTPVerification(
                                                    incomingEmail: inputEmail,
                                                    incomingPassword:
                                                        inputPassword,
                                                    incomingName: inputName,
                                                    incomingPhone: inputPhone,
                                                    incomingverificationID:
                                                        verificationID,
                                                  );
                                                }), (route) => false);
                                              },
                                            ),
                                          ],
                                        );
                                      });
                                    },
                                    verificationFailed: (FirebaseAuthException
                                        verificationFailed) async {
                                      //
                                      setState(() {
                                        showLoading = false;
                                      });
                                      showTopSnackBar(
                                        context,
                                        CustomSnackBar.error(
                                          message: verificationFailed.message
                                              .toString(),
                                        ),
                                      );
                                    },
                                    codeSent: (String verificationId,
                                        int? resendToken) async {
                                      setState(() {
                                        showLoading = false;
                                        verificationID = verificationId;
                                      });

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
                                    },
                                    codeAutoRetrievalTimeout:
                                        (String verificationId) async {
                                      //
                                      setState(() {
                                        showLoading = false;
                                      });
                                    });
                              }
                            }),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:nextwave/components/elevated_button.dart';
import 'package:nextwave/components/text_field.dart';
import 'package:nextwave/presentation/Screens/authentification/user_infos.dart';
import 'package:nextwave/services/email_validation_service.dart';

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
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(
                      'Authentification',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.2),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      //an action should be performed here
                    },
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        const EdgeInsets.all(15),
                      ),
                      elevation: MaterialStateProperty.all(0),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Colors.grey,
                    ),
                    hintText: 'Password',
                    onChanged: (input) {
                      setState(() {
                        inputPassword = input;
                      });
                    },
                    checkInput: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Invalid input';
                      } else if (value.length < 6) {
                        return 'A 6 digits password is required';
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
                        //
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

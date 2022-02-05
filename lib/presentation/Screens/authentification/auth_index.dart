import 'package:flutter/material.dart';
import 'package:nextwave/components/elevated_button.dart';
import 'package:nextwave/components/text_field.dart';
import 'package:nextwave/index.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/tap_bounce_container.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class AuthentificationIndexScreen extends StatefulWidget {
  const AuthentificationIndexScreen({Key? key}) : super(key: key);

  @override
  _AuthentificationIndexScreenState createState() =>
      _AuthentificationIndexScreenState();
}

class _AuthentificationIndexScreenState
    extends State<AuthentificationIndexScreen> {
  bool obscurePassword = true;
  bool validateEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value.toString())) {
      return false;
    } else {
      return true;
    }
  }

  // Create a global key that uniquely identifies the Form widget
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 50.0),
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
                    checkInput: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !validateEmail(value)) {
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
                    checkInput: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Incorrect input';
                      } else if (value.length < 6) {
                        return 'A 6 digits password is required';
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
                            Navigator.of(context).pushNamed('/resetPassword1');
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
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // showTopSnackBar(
                          //   context,
                          //   const CustomSnackBar.error(
                          //     message: "Data Processing...",
                          //   ),
                          // );
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const Index()),
                              (route) => false);
                        }
                      }),
                  const SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don’t have an account yet?',
                        style: TextStyle(color: Colors.grey, fontSize: 16.0),
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

import 'package:flutter/material.dart';
import 'package:nextwave/components/elevated_button.dart';
import 'package:nextwave/components/text_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 50.0),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  'Authentification',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 16.0),
              Flexible(
                child: ElevatedButton(
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
              const InputFormFieldWidget(
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.grey,
                ),
                hintText: 'Email address',
              ),
              const SizedBox(height: 10.0),
              InputFormFieldWidget(
                prefixIcon: const Icon(
                  Icons.lock,
                  color: Colors.grey,
                ),
                hintText: 'Password',
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
                    //
                    Navigator.of(context).pushNamed('/sign_up_user_infos');
                  }),
              const SizedBox(height: 15.0),
            ],
          ),
        ),
      ),
    );
  }
}

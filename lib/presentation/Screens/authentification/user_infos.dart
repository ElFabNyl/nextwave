import 'package:flutter/material.dart';
import 'package:nextwave/components/elevated_button.dart';
import 'package:nextwave/components/text_field.dart';

class SignUpUserInfos extends StatefulWidget {
  final String email;
  final String password;
  const SignUpUserInfos({
    Key? key,
    required this.email,
    required this.password,
  }) : super(key: key);

  @override
  _SignUpUserInfosState createState() => _SignUpUserInfosState();
}

class _SignUpUserInfosState extends State<SignUpUserInfos> {
  @override
  Widget build(BuildContext context) {
    //this line before the return, is to extract our incoming arguments

    Map arguments = ModalRoute.of(context)!.settings.arguments as Map;

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
            child: Column(
              children: [
                Image.asset('assets/images/user_infos.png'),
                const SizedBox(height: 20.0),
                //je teste
                Text(arguments['email']),
                //
                const InputFormFieldWidget(
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.grey,
                  ),
                  hintText: 'Username',
                ),
                const SizedBox(height: 20.0),
                const InputFormFieldWidget(
                  prefixIcon: Icon(
                    Icons.phone,
                    color: Colors.grey,
                  ),
                  hintText: 'Phone number',
                ),
                const SizedBox(height: 20.0),
                DefaultElevatedButton(
                    text: const Text('Proceed'),
                    showArrowBack: false,
                    showArrowFoward: false,
                    onPressed: () {
                      //
                      Navigator.of(context).pushNamed('/opt');
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

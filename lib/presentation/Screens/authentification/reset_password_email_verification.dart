import 'package:flutter/material.dart';
import 'package:nextwave/components/elevated_button.dart';
import 'package:nextwave/components/text_field.dart';

class ResetPasswordScreen2 extends StatefulWidget {
  const ResetPasswordScreen2({ Key? key }) : super(key: key);

  @override
  _ResetPasswordScreen2State createState() => _ResetPasswordScreen2State();
}

class _ResetPasswordScreen2State extends State<ResetPasswordScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Password Reset',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 40.0),
            child: Column(
              children: [
                const Text(
                  'PASSWORD RESET',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22.0),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                const Text(
                  'Please check your emails and fill the input bellow',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const InputFormFieldWidget(hintText: 'Enter the  code received '),
                const SizedBox(height: 5.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text(
                      '00:30',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                const SizedBox(height: 50.0),
                DefaultElevatedButton(
                    text: const Text('Proceed'),
                    showArrowBack: false,
                    showArrowFoward: false,
                    onPressed: () {
                      //
                      
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
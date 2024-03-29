import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:nextwave/components/elevated_button.dart';
import 'package:nextwave/models/user.dart';
import 'package:nextwave/presentation/Screens/authentification/auth_index.dart';
import 'package:nextwave/presentation/Screens/authentification/get_started.dart';
import 'package:nextwave/services/api_service_auth.dart';

class TermsAndPolicy extends StatefulWidget {
  final String incomingEmail;
  final String incomingPassword;
  final String incomingName;
  final String incomingPhone;
  const TermsAndPolicy({
    required this.incomingEmail,
    required this.incomingPassword,
    required this.incomingName,
    required this.incomingPhone,
  });

  @override
  State<TermsAndPolicy> createState() => _TermsAndPolicyState();
}

class _TermsAndPolicyState extends State<TermsAndPolicy> {
  late User userRegistered;
  //
  bool showLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Terms and return policy',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: showLoading
          ? const Center(
              child: CircularProgressIndicator(
              color: Colors.red,
            ))
          : Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          "Return policy",
                          style: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 19.0),
                        )
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Expanded(
                          child: Text(
                              'brejbopn jngvioerg erieohgoierg irgjeoinr iojgeirg eiorgehrog erigoeigo igeorhghrg  blablalba fçezh eziufze fiuf iufiu flutter fuzifz ejgejrgjpjrger ingehr ireogh'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          "Terms of service",
                          style: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 19.0),
                        )
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Expanded(
                          child: Text(
                              'brejbopn jngvioerg erieohgoierg irgjeoinr iojgeirg eiorgehrog erigoeigo igeorhghrg  blablalba fçezh eziufze fiuf iufiu flutter fuzifz ejgejrgjpjrger ingehr ireogh'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50.0),
                    Column(children: [
                      DefaultElevatedButton(
                          text: const Text('I Agree'),
                          showArrowBack: false,
                          showArrowFoward: false,
                          onPressed: () async {
                            //avant de l'envoyer sur la prochaine page, on appelle l'API pour l'enregistrer
                            //et recevoir son token de connexion.
                            //
                            setState(() {
                              showLoading = true;
                            });

                            userRegistered = await (AuthentificationApiService.register(
                              widget.incomingName,
                              widget.incomingPhone,
                              widget.incomingEmail,
                              widget.incomingPassword,
                            ));

                            setState(() {
                              showLoading = false;
                            });

                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (BuildContext context) {
                              return GetStarted(
                                  incominguserRegistered: userRegistered);
                            }), (route) => false);
                          }),
                      const SizedBox(height: 10.0),
                      TextButton(
                          onPressed: () {
                            //s'il n'accepte pas les conditions, on le balance à l'accueil
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const AuthentificationIndexScreen()),
                                (route) => false);
                          },
                          child: const Text(
                            'I desagree',
                            style: TextStyle(
                                color: Color(0xff0C4CC9),
                                fontWeight: FontWeight.w800),
                          )),
                    ]),
                  ],
                ),
              ),
            ),
    );
  }
}

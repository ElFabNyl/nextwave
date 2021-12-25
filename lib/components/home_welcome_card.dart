import 'package:flutter/material.dart';

class HomeWelcomeCard extends StatelessWidget {
  final String  welcomeText;
  final String userName;
  final String imagePath;
  const HomeWelcomeCard({
    Key? key,
    required this.welcomeText,
    required this.userName,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.17,
      width: double.infinity,
      decoration: BoxDecoration(
          color: const Color(0xffFFB7B7),
          borderRadius: BorderRadius.circular(15.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  welcomeText,
                  style: const TextStyle(fontSize: 16.0),
                ),
                Text(
                  userName,
                  style: const TextStyle(
                      fontWeight: FontWeight.w900, fontSize: 21.0),
                )
              ],
            ),
          ),
          Image.asset(imagePath)
        ],
      ),
    );
  }
}

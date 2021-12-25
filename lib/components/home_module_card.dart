import 'package:flutter/material.dart';

class HomeModuleCard extends StatelessWidget {
  final Function() action;
  final String imagePath;
  final String moduleName;
  final String moduleDescription;

  const HomeModuleCard({
    Key? key,
    required this.action,
    required this.imagePath,
    required this.moduleName,
    required this.moduleDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.14,
        width: double.infinity,
        decoration: BoxDecoration(
            color: const Color(0xffEDEDED),
            borderRadius: BorderRadius.circular(15.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 65.0,
              width: 65.0,
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  moduleName,
                  style: const TextStyle(
                      fontWeight: FontWeight.w900, fontSize: 21.0),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                SizedBox(
                  width: 200.0,
                  child: Text(
                    moduleDescription,
                    style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 17.0,
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
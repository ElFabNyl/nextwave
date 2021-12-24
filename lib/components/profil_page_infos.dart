import 'package:flutter/material.dart';

class ProfilPageInfos extends StatelessWidget {
  final Widget icon;
  final String label;
  final String content;
  final Function() editFunction;

  const ProfilPageInfos({
    Key? key,
    required this.icon,
    required this.label,
    required this.content,
    required this.editFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            icon,
            const SizedBox(
              width: 20.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                      fontWeight: FontWeight.w800, fontSize: 18.0),
                ),
                Text(
                  content,
                  style: const TextStyle(color: Colors.grey, fontSize: 16.0),
                )
              ],
            ),
          ],
        ),
        Row(
          children: [
            TextButton(
              onPressed: editFunction,
              child: const Text(
                'Edit',
                style: TextStyle(
                    color: Color(0xff2752A7), fontWeight: FontWeight.w900),
              ),
            )
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class DefaultElevatedButton extends StatelessWidget {
  final Widget text;

  final bool showArrowBack;
  final bool showArrowFoward;
  final Color? backgroundColor;
  final double? elevation;
  final void Function() onPressed;
  const DefaultElevatedButton({
    Key? key,
    required this.text,
    required this.showArrowBack,
    required this.showArrowFoward,
    this.backgroundColor,
    this.elevation = 0,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.all(15),
        ),
        elevation: MaterialStateProperty.all(elevation),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(
          backgroundColor,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          showArrowBack
              ? const Icon(Icons.arrow_back, color: Colors.white)
              : const Text(''),
          text,
          showArrowFoward
              ? const Icon(Icons.arrow_forward, color: Colors.white)
              : const Text(''),
        ],
      ),
    );
  }
}

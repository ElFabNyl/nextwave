import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final bool isShoppingBag;
  final bool showArrow;
  final bool showBell;
  final bool showBadge;
  final Widget? title;
  final String? badgeContent;
  final Function()? notificationBellFunction;

  const AppBarWidget({
    Key? key,
    required this.isShoppingBag,
    required this.showArrow,
    required this.showBell,
    required this.showBadge,
    this.title,
    this.badgeContent,
    this.notificationBellFunction,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      elevation: 0.0,
      leading: showArrow
          ? IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ))
          : null,
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: IconButton(
            onPressed: notificationBellFunction,
            icon: showBadge
                ? Badge(
                    badgeContent: Text(
                      badgeContent.toString(),
                      style: const TextStyle(color: Color(0xff510707)),
                    ),
                    child: showBell
                        ? const Icon(
                            Icons.notifications,
                            color: Colors.white,
                          )
                        : isShoppingBag
                            ? const Icon(
                                Icons.shopping_bag,
                                color: Colors.white,
                              )
                            : null,
                    badgeColor: const Color(0xffFFB7B7),
                  )
                : const Text(''),
          ),
        )
      ],
    );
  }
}

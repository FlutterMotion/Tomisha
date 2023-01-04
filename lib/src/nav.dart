import 'package:flutter/material.dart';
import 'package:prototype/const/colors.dart';

class NavAppBar extends PreferredSize {
  const NavAppBar({super.key})
      : super(child: const NavBar(), preferredSize: const Size.fromHeight(67));
}

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 67,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.themedColor(context).boxShadow,
            blurRadius: 3,
            spreadRadius: 6,
          ),
        ],
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () {},
            child: const Text("Login"),
          )
        ],
      ),
    );
  }
}

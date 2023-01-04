import 'package:flutter/material.dart';
import 'package:prototype/const/colors.dart';

class NavAppBar extends PreferredSize {
  const NavAppBar(
      {super.key,
      required super.child,
      super.preferredSize = const Size.fromHeight(67)});
}

class NavBar extends StatefulWidget {
  final ScrollController? scrollController;
  const NavBar({Key? key, this.scrollController}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  bool showRegisterButton = false;
  @override
  void initState() {
    widget.scrollController?.addListener(() {
      final offset = widget.scrollController?.offset ?? 0;
      if (offset > 500) {
        if (!showRegisterButton) setState(() => showRegisterButton = true);
      } else {
        if (showRegisterButton) setState(() => showRegisterButton = false);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width <= 500;

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
          if (showRegisterButton) ...[
            const Text('Jetzt Klicken'),
            const SizedBox(width: 25),
            OutlinedButton(
              onPressed: () {},
              child: const Text("Kostenlos Registrieren"),
            ),
          ],
          TextButton(
            onPressed: () {},
            child: const Text("Login"),
          )
        ],
      ),
    );
  }
}

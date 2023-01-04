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
      final isMobile = MediaQuery.of(context).size.width <= 500;

      // the position of register button on desktop and mobile are different
      if (offset > (isMobile ? 530 : 420)) {
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
          AnimatedSwitcher(
            duration: const Duration(seconds: 2),
            child: showRegisterButton
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('Jetzt Klicken'),
                      const SizedBox(width: 25),
                      OutlinedButton(
                        onPressed: () {},
                        child: const Text("Kostenlos Registrieren"),
                      ),
                    ],
                  )
                : const SizedBox(),
          ),
          TextButton(
            onPressed: () {},
            child: const Text("Login"),
          )
        ],
      ),
    );
  }
}

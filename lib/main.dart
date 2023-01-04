import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prototype/const/colors.dart';
import 'package:prototype/const/resource.dart';
import 'package:prototype/src/nav.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        textTheme: GoogleFonts.latoTextTheme(),
        primaryColor: AppColors.lightColor.primary,
        primaryColorLight: AppColors.lightColor.primary,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: AppColors.lightColor.primary1,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
          ),
        ),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NavAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: DiagonalPathClipperOne(),
              child: Container(
                height: 500.37,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xffEBF4FF),
                      Color(0xffE6FFFA),
                    ],
                  ),
                ),
                child: Row(
                  children: [
                    const Expanded(child: SizedBox()),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Deine Job website",
                            style:
                                Theme.of(context).textTheme.headline2?.copyWith(
                                      color: AppColors.lightColor.textColor1,
                                    ),
                          ),
                          const SizedBox(height: 65),
                          FilledButton(
                            buttonText: "Kostenlos Registrieren",
                            onPressed: () {},
                            gradientColors: [
                              AppColors.lightColor.primary1,
                              AppColors.lightColor.appBlue,
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    Expanded(
                        child: SvgPicture.asset(
                            R.ASSETS_SVG_UNDRAW_AGREEMENT_AAJR_SVG)),
                    const Expanded(child: SizedBox()),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DiagonalPathClipperOne extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var firstStart = Offset(size.width / 5, size.height);
    var firstEnd = Offset(size.width / 2.25, size.height - 50.0);

    var secondStart =
        Offset(size.width - (size.width / 3.24), size.height - 105);
    var secondEnd = Offset(size.width, size.height - 80);

    final path = Path()
      ..lineTo(0.0, size.height)
      ..quadraticBezierTo(
          firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy)
      ..quadraticBezierTo(
          secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy)
      ..lineTo(size.width, 0.0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class FilledButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String? buttonText;
  final Widget? child;
  final Color? foregroundColor;
  final double radius;

  /// if gradient colors are provided the background color is ignored.
  final List<Color>? gradientColors;
  final Color? backgroundColor;
  const FilledButton({
    Key? key,
    required this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.gradientColors,
    this.buttonText,
    this.child,
    this.radius = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        gradient: gradientColors != null
            ? LinearGradient(colors: gradientColors!)
            : null,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius)),
          foregroundColor: foregroundColor,
          backgroundColor:
              gradientColors == null ? backgroundColor : Colors.transparent,
        ),
        onPressed: onPressed,
        child: buttonText != null ? Text(buttonText!) : child,
      ),
    );
  }
}

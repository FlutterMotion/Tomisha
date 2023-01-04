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
        scaffoldBackgroundColor: Colors.white,
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
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.lightColor.primary1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
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
  late final ScrollController scrollController;
  @override
  void initState() {
    // TODO: implement initState
    scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavAppBar(
        child: NavBar(
          scrollController: scrollController,
        ),
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: const [
            RegisterComponent(),
            SizedBox(height: 1003),
            SizedBox(height: 1003),
            SizedBox(height: 1003),
          ],
        ),
      ),
    );
  }
}

class RegisterComponent extends StatelessWidget {
  const RegisterComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth > 500) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return ClipPath(
              clipper: DiagonalPathClipperOne(),
              child: Container(
                height: 600.37,
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
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(flex: 1),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          constraints: BoxConstraints(
                              maxWidth: constraints.maxWidth > 800
                                  ? 320
                                  : constraints.maxWidth / 2 - 20,
                              minWidth: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                "Deine Job website",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2
                                    ?.copyWith(
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
                        SizedBox(width: constraints.maxWidth > 800 ? 65 : 10),
                        Container(
                          constraints: BoxConstraints(
                            maxHeight: constraints.maxWidth > 800
                                ? 400
                                : constraints.maxWidth / 2 - 20,
                          ),
                          child: ClipOval(
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: Container(
                                color: Colors.white,
                                child: SvgPicture.asset(
                                  R.ASSETS_SVG_UNDRAW_AGREEMENT_AAJR_SVG,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(flex: 2)
                  ],
                ),
              ),
            );
          },
        ),
      );
    }
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xffEBF4FF),
            Color(0xffE6FFFA),
          ],
        ),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              SvgPicture.asset(
                R.ASSETS_SVG_UNDRAW_AGREEMENT_AAJR_SVG,
                fit: BoxFit.fitWidth,
                height: 600,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Deine Job website",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline3?.copyWith(
                          color: AppColors.lightColor.textColor1,
                        ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 128,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.themedColor(context).boxShadow,
                          blurRadius: 9,
                          spreadRadius: 0,
                          offset: Offset(0, -8)),
                    ],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
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
              )
            ],
          ),
        ],
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

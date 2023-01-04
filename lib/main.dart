import 'package:collection/collection.dart';
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
        tabBarTheme: TabBarTheme(
          labelColor: AppColors.lightColor.white,
          unselectedLabelColor: AppColors.lightColor.primary,
          indicator: BoxDecoration(
            color: AppColors.lightColor.primary,
          ),
        ),
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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late final ScrollController scrollController;
  late final TabController tabController;
  @override
  void initState() {
    // TODO: implement initState
    scrollController = ScrollController();
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    scrollController.dispose();
    tabController.dispose();
    super.dispose();
  }

  final TabData tab0 = const TabData(
    title: "Drei einfache Schritte zur Vermittlung a asd",
    sections: [
      TabSection(
        title: "Erstellen dein Lebenslauf asdas das asd ad ",
        asset: R.ASSETS_SVG_UNDRAW_PROFILE_DATA_RE_V81R_SVG,
      ),
      TabSection(
        title: "Erstellen dein Lebenslauf as dasd asd asd asd",
        asset: R.ASSETS_SVG_UNDRAW_TASK_31WC_SVG,
      ),
      TabSection(
        title: "Mit nur einem Klick bewerben asd asd  asd s",
        asset: R.ASSETS_SVG_UNDRAW_PERSONAL_FILE_222M_SVG,
      ),
    ],
  );

  final TabData tab1 = const TabData(
    title: "Drei einfache Schritte zu deinem neuen Job",
    sections: [
      TabSection(
        title: "Erstellen dein Lebenslauf",
        asset: R.ASSETS_SVG_UNDRAW_PROFILE_DATA_RE_V81R_SVG,
      ),
      TabSection(
        title: "Erstellen dein Lebenslauf",
        asset: R.ASSETS_SVG_UNDRAW_TASK_31WC_SVG,
      ),
      TabSection(
        title: "Mit nur einem Klick bewerben",
        asset: R.ASSETS_SVG_UNDRAW_PERSONAL_FILE_222M_SVG,
      ),
    ],
  );

  final TabData tab2 = const TabData(
    title: "Drei einfache Schritte zur Vermittlung neuer ",
    sections: [
      TabSection(
        title: "Erstellen dein Lebenslauf asdas das ",
        asset: R.ASSETS_SVG_UNDRAW_PROFILE_DATA_RE_V81R_SVG,
      ),
      TabSection(
        title: "Erstellen dein Lebenslauf as dasd asd",
        asset: R.ASSETS_SVG_UNDRAW_TASK_31WC_SVG,
      ),
      TabSection(
        title: "Mit nur einem Klick bewerben asd asd ",
        asset: R.ASSETS_SVG_UNDRAW_PERSONAL_FILE_222M_SVG,
      ),
    ],
  );
  int selectedIndex = 0;
  List<String> tabs = [
    "Arbeitnehmer",
    "Arbeitgeber",
    "Temporärbüro",
  ];
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
          children: [
            const RegisterComponent(),
            const SizedBox(height: 50),
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...tabs.mapIndexed(
                      (index, element) => InkWell(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: index == 0
                                  ? const Radius.circular(10)
                                  : const Radius.circular(0),
                              topRight: index == 2
                                  ? const Radius.circular(10)
                                  : const Radius.circular(0),
                              bottomLeft: index == 0
                                  ? const Radius.circular(10)
                                  : const Radius.circular(0),
                              bottomRight: index == 2
                                  ? const Radius.circular(10)
                                  : const Radius.circular(0),
                            ),
                            color: selectedIndex == index
                                ? AppColors.lightColor.primary
                                : null,
                            border: Border.all(
                              color: selectedIndex == index
                                  ? AppColors.lightColor.primary
                                  : AppColors.lightColor.borderColor,
                            ),
                          ),
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            "Arbeitnehmer",
                            style: GoogleFonts.lato().copyWith(
                                color: selectedIndex == index
                                    ? Colors.white
                                    : AppColors.lightColor.primary),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            const SizedBox(height: 50),
            TabView(
              data: selectedIndex == 0
                  ? tab0
                  : selectedIndex == 1
                      ? tab1
                      : tab2,
            ),
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
      return ClipPath(
        clipper: DiagonalPathClipperOne(),
        child: Container(
          height: 600.37,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xffEBF4FF),
                Color(0xffE6FFFA),
              ],
            ),
          ),
          child: LayoutBuilder(builder: (context, constraints) {
            return Row(
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
            );
          }),
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
                          offset: const Offset(0, -8)),
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

class TabData {
  final String title;
  final List<TabSection> sections;

  const TabData({
    required this.title,
    required this.sections,
  });
}

class TabSection {
  final String title;
  final String asset;

  const TabSection({
    required this.title,
    required this.asset,
  });
}

class TabView extends StatelessWidget {
  final TabData data;
  const TabView({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(
          constraints: const BoxConstraints(maxWidth: 350),
          child: Text(
            data.title,
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        Stack(
          children: [
            Column(
              children: [
                ...data.sections.mapIndexed(
                  (i, e) {
                    final index = i + 1;
                    return LayoutBuilder(builder: (context, c) {
                      return Column(
                        children: [
                          if (index != 2)
                            SizedBox(height: screenWidth > 760 ? 100 : 40)
                          else
                            SizedBox(height: screenWidth > 760 ? 150 : 60),
                          ClipPath(
                            // clipper: index.isEven ? TabSectionClipper() : null,
                            child: Container(
                              width: double.infinity,
                              // height: index.isEven ? 400 : null,
                              decoration: index.isEven
                                  ? const BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xffE6FFFA),
                                          Color(0xffEBF4FF),
                                        ],
                                      ),
                                    )
                                  : null,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (index.isEven) ...[
                                    _buildImage(screenWidth, e),
                                    const SizedBox(width: 70),
                                  ],
                                  SizedBox(
                                    width: screenWidth > 760
                                        ? 500
                                        : screenWidth * .5,
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        SizedBox(
                                          height: 260,
                                          width: 385,
                                          child: CircleAvatar(
                                            radius: 80,
                                            backgroundColor: i.isEven
                                                ? AppColors
                                                    .lightColor.backgroundColor
                                                : Colors.transparent,
                                          ),
                                        ),
                                        Positioned(
                                          bottom: (screenWidth > 760
                                                  ? 260
                                                  : screenWidth * .2) /
                                              2,
                                          left: (screenWidth > 760
                                                  ? 260
                                                  : screenWidth * .2) /
                                              2,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                "$index.",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline2
                                                    ?.copyWith(
                                                      color:
                                                          AppColors.themedColor(
                                                                  context)
                                                              .textColor1,
                                                      height: .5,
                                                    ),
                                              ),
                                              const SizedBox(width: 10),
                                              Flexible(
                                                child: Text(
                                                  e.title,
                                                  maxLines: 2,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline6
                                                      ?.copyWith(
                                                          color: AppColors
                                                                  .themedColor(
                                                                      context)
                                                              .textColor1),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (index.isOdd) ...[
                                    const SizedBox(width: 70),
                                    _buildImage(screenWidth, e),
                                  ]
                                ],
                              ),
                            ),
                          ),
                          if (index != 2)
                            SizedBox(height: screenWidth > 760 ? 100 : 40)
                          else
                            SizedBox(height: screenWidth > 760 ? 50 : 20)
                        ],
                      );
                    });
                  },
                ),
              ],
            ),
            if (screenWidth > 760)
              Positioned(
                left: 0,
                right: 0,
                top: 300,
                child: SvgPicture.asset(
                  R.ASSETS_SVG_ARROW_RIGHT_SVG,
                ),
              ),
            if (screenWidth > 760)
              Positioned(
                left: 0,
                right: 0,
                bottom: 300,
                child: SvgPicture.asset(
                  R.ASSETS_SVG_ARROW_LEFT_SVG,
                ),
              ),
          ],
        )
      ],
    );
  }

  SizedBox _buildImage(double screenWidth, TabSection e) {
    return SizedBox(
      height: screenWidth > 970 ? 260 : screenWidth * .3,
      width: screenWidth > 970 ? 385 : screenWidth * .3,
      child: SvgPicture.asset(
        e.asset,
        fit: BoxFit.contain,
      ),
    );
  }
}

class TabSectionClipper extends CustomClipper<Path> {
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

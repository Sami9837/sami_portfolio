import 'package:flutter/material.dart';
import 'package:sami_4th_task/constants/colors.dart';
import 'package:sami_4th_task/constants/sns_links.dart';
import 'package:sami_4th_task/widgets/contact_section.dart';
import 'package:sami_4th_task/widgets/main_desktop.dart';
import 'package:sami_4th_task/widgets/main_mobile.dart';
import 'package:sami_4th_task/widgets/project_section.dart';
import 'package:sami_4th_task/widgets/skills_desktop.dart';
import 'package:sami_4th_task/widgets/skills_mobile.dart';
import 'dart:js' as js;
import 'package:sami_4th_task/constants/size.dart';
import 'package:sami_4th_task/widgets/drawer_mobile.dart';
import 'package:sami_4th_task/widgets/footer.dart';
import 'package:sami_4th_task/widgets/header_desktop.dart';
import 'package:sami_4th_task/widgets/header_mobile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final List<GlobalKey> navbarKeys = List.generate(4, (index) => GlobalKey());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        key: scaffoldKey,
        backgroundColor: CustomColor.scaffoldBg,
        endDrawer: constraints.maxWidth >= kMinDesktopWidth
            ? null
            : DrawerMobile(onNavItemTap: (int navIndex) {
                scaffoldKey.currentState?.closeEndDrawer();
                scrollToSection(navIndex);
              }),
        body: SingleChildScrollView(
          controller: scrollController,
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(key: navbarKeys.first),
              if (constraints.maxWidth >= kMinDesktopWidth)
                HeaderDesktop(onNavMenuTap: (int navIndex) {
                  scrollToSection(navIndex);
                })
              else
                HeaderMobile(
                  onLogoTap: () {},
                  onMenuTap: () {
                    scaffoldKey.currentState?.openEndDrawer();
                  },
                ),
              if (constraints.maxWidth >= kMinDesktopWidth)
                const MainDesktop()
              else
                const MainMobile(),
              ProjectsSection(
                key: navbarKeys[2],
              ),
              const SizedBox(height: 30),
              Container(
                key: navbarKeys[1],
                width: screenWidth,
                padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                color: CustomColor.bgLight1,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Skills",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: CustomColor.whitePrimary,
                      ),
                    ),
                    const SizedBox(height: 50),
                    if (constraints.maxWidth >= kMedDesktopWidth)
                      const SkillsDesktop()
                    else
                      const SkillsMobile(),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              ContactSection(
                key: navbarKeys[3],
              ),
              const SizedBox(height: 30),
              const Footer(),
            ],
          ),
        ),
      );
    });
  }

  void scrollToSection(int navIndex) {
    if (navIndex == 4) {
      js.context.callMethod('open', [SnsLinks.blog]);
      return;
    }

    final key = navbarKeys[navIndex];
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}

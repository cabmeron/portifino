import 'package:flutter/material.dart';
import 'package:psite/section_scr2.dart';
import 'package:psite/section_scr3.dart';
import 'title_section.dart';
import 'about_me_old.dart';
import 'about_me.dart';
import 'section_scr_1.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  _PortfolioPageState createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  late ScrollController _scrollController;
  bool showAboutMe = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void showAboutMeSection() {
    setState(() {
      showAboutMe = true;
    });
    _scrollController.animateTo(
      MediaQuery.of(context).size.height, // Scroll to the next section
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void hideAboutMeSection() {}

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: const Column(
          children: [
            IntroSectionWidget(title: 'Section 1'),
            SectionSpacer1(),
            SectionSpacer3(),
            // SectionSpacer2(),
            AboutMeSectionNEW()
          ],
        ),
      ),
    );
  }
}

class IntroSectionWidget extends StatelessWidget {
  final String title;

  const IntroSectionWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 685,
        color: Colors.white,
        child: const Row(children: [
          Expanded(
            flex: 1,
            child: IntroductionWidget(),
          ),
        ]));
  }
}

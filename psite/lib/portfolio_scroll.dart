import 'package:flutter/material.dart';
import 'title_section.dart';
import 'about_me.dart';

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
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            IntroSectionWidget(title: 'Section 1'),
            SizedBox(
              height: 355,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.white),
              ),
            ),
            if (showAboutMe)
              AboutMeWidget()
            else
              ElevatedButton(
                onPressed: showAboutMeSection,
                child: const Text('Show About Me'),
              ),
            // IntroSectionWidget(title: 'Section 2'),
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
          )
        ]));
  }
}

//  @override
//   Widget build(BuildContext context) {
//     return Container(
//         height: 710,
//         color: Colors.grey,
//         child: Row(children: [
//           Expanded(
//             flex: 1,
//             child: Container(
//               color: Colors.blue,
//               child: const Center(
//                 child: Text("Testing"),
//               ),
//             ),
//           ),
//           Expanded(
//               flex: 1,
//               child: Container(
//                   padding: const EdgeInsets.all(16.0),
//                   child: const Center(
//                       child: Text(
//                     "TESTING",
//                     style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
//                   ))))
//         ]));
//   }
// }

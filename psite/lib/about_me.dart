import 'package:flutter/material.dart';

class AboutMeWidget extends StatelessWidget {
  const AboutMeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: 900,
        margin: const EdgeInsets.symmetric(vertical: 16.0),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            AboutMeItem(
                imagePath: 'assets/babyMouth.jpg', text: "First I was born"),
            AboutMeItem(imagePath: 'assets/babyMouth.jpg', text: "ITEM1"),
            AboutMeItem(imagePath: 'assets/babyMouth.jpg', text: "ITEM1"),
            AboutMeItem(imagePath: 'assets/babyMouth.jpg', text: "ITEM1"),
            AboutMeItem(imagePath: 'assets/babyMouth.jpg', text: "ITEM1"),
            AboutMeItem(imagePath: 'assets/babyMouth.jpg', text: "ITEM1"),
            AboutMeItem(imagePath: 'assets/babyMouth.jpg', text: "ITEM1"),
            AboutMeItem(imagePath: 'assets/babyMouth.jpg', text: "ITEM1"),
            AboutMeItem(imagePath: 'assets/babyMouth.jpg', text: "ITEM1"),
            AboutMeItem(imagePath: 'assets/babyMouth.jpg', text: "ITEM1"),
            AboutMeItem(imagePath: 'assets/babyMouth.jpg', text: "ITEM1"),
            AboutMeItem(imagePath: 'assets/babyMouth.jpg', text: "ITEM1"),
          ],
        ));
  }
}

class AboutMeItem extends StatelessWidget {
  final String imagePath;
  final String text;

  const AboutMeItem({Key? key, required this.imagePath, required this.text})
      : super(key: key);

  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        width: 800,
        child: Column(children: [
          Image.asset(
            imagePath,
            width: 422,
            height: 445,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 8.0),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          )
        ]));
  }
}

class AboutMeSection extends StatefulWidget {
  const AboutMeSection({Key? key}) : super(key: key);

  @override
  _AboutMeSectionState createState() => _AboutMeSectionState();
}

class _AboutMeSectionState extends State<AboutMeSection> {
  late PageController _pageController;
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  void toggleExpansion() {
    setState(() {
      isExpanded = !isExpanded;
      if (!isExpanded) {
        _pageController.animateToPage(
          0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.decelerate,
        );
      } else {
        _pageController.animateToPage(
          1,
          duration: const Duration(milliseconds: 500),
          curve: Curves.decelerate,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              _pageController.animateToPage(
                1, // Assuming 1 is the index of the expanded state
                duration: const Duration(milliseconds: 5000),
                curve: Curves.decelerate,
              );
            },
            child: const Text("About Me"),
          ),
          const SizedBox(height: 16.0),
          if (isExpanded)
            Expanded(
              child: Container(
                height: 450,
                child: PageView(
                  controller: _pageController,
                  children: [
                    // Your AboutMeItem2 widgets here
                  ],
                ),
              ),
            ),
          if (isExpanded)
            ElevatedButton(
              onPressed: toggleExpansion,
              child: const Text('Hide About Me'),
            ),
        ],
      ),
    );
  }
}

class AboutMeItem2 extends StatelessWidget {
  final String imagePath;
  final String title;

  const AboutMeItem2({Key? key, required this.imagePath, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        width: 345,
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Image.asset(
              imagePath,
              width: 325,
              height: 375,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 8.0),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            )
          ],
        ));
  }
}

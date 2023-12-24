import 'package:flutter/material.dart';
import 'package:psite/portfolio_scroll.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> navItems = [
    ElevatedButton(onPressed: () {}, child: const Text("About Me")),
    ElevatedButton(onPressed: () {}, child: const Text("Art")),
    ElevatedButton(onPressed: () {}, child: const Text("Test")),
  ];
  bool mobile = false;
  @override
  Widget build(BuildContext context) {
    mobile = MediaQuery.of(context).size.width > 700 ? false : true;

    return Scaffold(
        appBar: AppBar(
          title: const Text("Test"),
          actions: mobile ? null : navItems,
        ),
        drawer: mobile
            ? Drawer(
                child: ListView(
                children: navItems,
              ))
            : null,
        body: const PortfolioPage());
  }
}

import 'package:flutter/material.dart';

class AboutMeSectionNEW extends StatelessWidget {
  const AboutMeSectionNEW({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(16.0),
      color: const Color(0xffe3e3e3),
      height: height * 0.05,
      width: width * .85,
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [],
          )
        ],
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  final int index;

  GridItem({required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue, // Background color of each grid item
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 8.0),
          Text(
            'Item $index',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SectionSpacer3 extends StatelessWidget {
  const SectionSpacer3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 105,
      decoration: BoxDecoration(
          color: const Color(0xffb74093),
          borderRadius:
              BorderRadius.vertical(bottom: Radius.elliptical(25, 25))),
      child: const Text(""),
    );
  }
}

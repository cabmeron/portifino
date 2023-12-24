import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SectionSpacer2 extends StatelessWidget {
  const SectionSpacer2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 975,
      decoration: BoxDecoration(
          color: const Color(0xffb74093),
          borderRadius: BorderRadius.circular(20.0)),
      child: const Text(""),
    );
  }
}

import 'package:flutter/material.dart';

class IntroductionWidget extends StatelessWidget {
  const IntroductionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: Colors.indigo.withOpacity(0.1),
                blurRadius: 0.1,
                spreadRadius: 0.1,
                blurStyle: BlurStyle.solid),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            const CircleAvatar(
              radius: 215.0,
              backgroundImage: AssetImage(
                  'assets/title_img.gif'), // Replace with the path to your image
            ),
            const SizedBox(height: 16.0),
            Container(
              padding: const EdgeInsets.all(11.0),
              child: const Column(
                children: [
                  Text(
                    "Hello! My name is Cameron ",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(height: 1.0),
                  Text(
                    "Graduating Computer Science @ University of Nevada, Reno MAY 2024",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 28, color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

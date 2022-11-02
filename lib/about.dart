import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("About")),
        body: Container(
          width: double.infinity,
          color: Colors.white,
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "What is BMI?",
                style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
              Text(
                  "Body Mass Index (BMI) is a person's weight in kilograms (or pounds) divided by the square of height in meters (or feet).",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
              Image(image: AssetImage("assets/about.jpg")),
            ],
          ),
        ),
      ),
    );
  }
}

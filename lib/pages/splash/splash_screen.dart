import 'package:flutter/material.dart';

import '../layout/layout_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LayoutScreen()));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(children: [
          Expanded(
              child: Center(
            child: Image.asset(
              "images/images.png",
              height: 150,
              width: 150,
            ),
          )),
          const Text(
            ('Developed by Mohammad'),
            style: TextStyle(color: Colors.grey),
          )
        ]),
      ),
    );
  }
}

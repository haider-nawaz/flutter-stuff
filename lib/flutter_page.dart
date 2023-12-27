import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class FlutterPage extends StatefulWidget {
  const FlutterPage({super.key});

  @override
  State<FlutterPage> createState() => _FlutterPageState();
}

class _FlutterPageState extends State<FlutterPage> {
  bool glow = false;
  startGlow() {
    Timer.periodic(const Duration(milliseconds: 10), (timer) {
      setState(() {
        glow = true;
      });
    });
  }

  @override
  void initState() {
    startGlow();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "and my superpower is...",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.normal),
              ).animate().fadeIn(
                    // delay: 500.ms,
                    duration: 500.ms,
                    curve: Curves.easeIn,
                  ),
              const Spacer(),
              AnimatedAlign(
                duration: const Duration(seconds: 1),
                curve: Curves.fastOutSlowIn,
                alignment: !glow ? Alignment.bottomRight : Alignment.center,
                child: Image.asset(
                  "assets/Can.png",
                  height: 100,
                  width: 100,
                )
                    .animate()
                    .shimmer(delay: 600.ms, duration: 1800.ms)
                    .shake(hz: 2, curve: Curves.easeInOutCubic)
                    .scaleXY(
                      end: 3,
                      duration: 1000.ms,
                    ),
              ),
              const Spacer(),
              const Text(
                "Made with ❤️ ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.normal),
              ).animate().fadeIn(
                    // delay: 500.ms,
                    duration: 500.ms,
                    curve: Curves.easeIn,
                  )
            ],
          ),
        ),
      ),
    );
  }
}

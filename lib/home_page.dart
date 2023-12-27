import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/route_manager.dart';

import 'flutter_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  bool animate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(
      //   title: const Text(
      //     'Glowing Button',
      //     style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
      //   ),
      //   backgroundColor: Colors.black,
      // ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            print("tapped");
            setState(() {
              animate = true;
            });
          },
          child: Stack(
            children: [
              Container(
                child: myText(),
              ),
              if (animate)
                AnimatedAlign(
                  duration: const Duration(seconds: 0),
                  curve: Curves.fastOutSlowIn,
                  alignment: animate ? Alignment.center : Alignment.bottomRight,
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  )
                      .animate()
                      .scaleXY(
                        delay: 0.ms,
                        duration: 1.seconds,
                        curve: Curves.fastOutSlowIn,
                        end: 5,
                      )
                      .shakeX(
                        delay: 500.ms,
                        duration: 2.seconds,
                        hz: 3,
                        //curve: Curves.easeIn,
                      )
                      .slideY(
                        delay: 2000.ms,
                        duration: 2.seconds,
                        curve: Curves.fastOutSlowIn,
                        end: -100,
                      ),
                )
            ],
          ),
        ),
      ),
    );
  }

  SafeArea avatarAnimation() {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset(
              "assets/avatar.PNG",
              height: 300,
              width: 300,
            ).animate().rotate(
                  duration: 2.seconds,
                  curve: Curves.fastOutSlowIn,
                ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                myText().animate().scale(
                      delay: 500.ms,
                      duration: 2.seconds,
                      curve: Curves.fastOutSlowIn,
                    ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "👋",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                )
                    .animate()
                    .fadeIn(
                      duration: 2.seconds,
                      curve: Curves.easeIn,
                      delay: 1400.ms,
                    )
                    .shimmer(delay: 1600.ms, duration: 1800.ms)
                    .shake(hz: 3, curve: Curves.easeInOutCubic)
                    .scaleXY(end: 1.6, duration: 800.ms)
                    .then(delay: 800.ms)
                    .scaleXY(end: 1 / 1.1)
              ],
            ),
            // AnimatedAlign(
            //     duration: 2.seconds,
            //     alignment: !glow ? Alignment.bottomLeft : Alignment.topCenter,
            //     child: Image.asset(
            //       "assets/Can.png",
            //       height: 100,
            //       width: 100,
            //     )
            //     // .animate()
            //     // .rotate(
            //     //   duration: 2.seconds,
            //     //   curve: Curves.fastOutSlowIn,
            //     // )
            //     // .shimmer(
            //     //   //duration: 2500.ms,
            //     //   curve: Curves.easeIn,
            //     //   delay: 500.ms,
            //     // ),
            //     ),

            const Spacer(),
            Container(
              //margin: const EdgeInsets.only(top: 50),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(50),
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_downward,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () {
                  Get.to(
                    () => const FlutterPage(),
                    transition: Transition.downToUp,
                    curve: Curves.fastOutSlowIn,
                    duration: 500.milliseconds,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Text myText() {
    return const Text(
      "Tap Anywhere",
      style: TextStyle(
        fontSize: 22,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  void startAnimation() {}
}

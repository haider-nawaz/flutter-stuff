import 'dart:async';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:reels/3d_obg.dart';
import 'package:reels/flex_example.dart';
import 'package:reels/home_page.dart';
import 'package:reels/isolate_example.dart';
import 'package:reels/plant_page.dart';

void main() async {
  Animate.restartOnHotReload = true;
  //ensure flutter binding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  // This widget is the root of your application.

  bool animate = false;
  bool animate1 = false;

  void startAnimating() {
    Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        animate = !animate;
      });
    });
  }

  @override
  void initState() {
    // startAnimating();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(child: Center(child: FlexExample()))),
    );
  }

  Widget animatedCardStack() {
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.loose,
      children: [
        // if (animate) ...[
        //   AnimatedContainer(
        //     duration: const Duration(milliseconds: 800),
        //     curve: Curves.fastOutSlowIn,
        //     transform: Matrix4.rotationZ(0.08),
        //     transformAlignment: Alignment.center,
        //     height: 170,
        //     width: 340,
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(30),
        //       color: Colors.white,
        //       boxShadow: [
        //         BoxShadow(
        //           color: Colors.black.withOpacity(0.5),
        //           blurRadius: 15,
        //           spreadRadius: .5,
        //           offset: const Offset(0, 0),
        //         ),
        //       ],
        //     ),
        //   )
        //       .animate(
        //         delay: const Duration(milliseconds: 100),
        //         autoPlay: false,
        //         target: animate ? 1 : 0,
        //       )
        //       .slideX(
        //         // duration: const Duration(milliseconds: 100),
        //         curve: Curves.easeIn,
        //         //begin: 0,
        //         //end: 2,
        //       )
        //       .then()
        //       .shakeX(
        //         hz: 2,
        //       )
        // ],
        AnimatedContainer(
          duration: const Duration(milliseconds: 800),
          curve: Curves.fastOutSlowIn,
          transform:
              !animate ? Matrix4.rotationZ(-0.08) : Matrix4.rotationZ(0.0),
          transformAlignment: Alignment.center,
          height: 170,
          width: 340,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 15,
                spreadRadius: .5,
                offset: const Offset(0, 0),
              ),
            ],
          ),
        ),
        GestureDetector(
          // //if the user swipes left or right, animate the card
          // onHorizontalDragEnd: (details) {
          //   if (details.primaryVelocity! > 0) {
          //     setState(() {
          //       animate = !animate;
          //     });
          //   } else if (details.primaryVelocity! < 0) {
          //     setState(() {
          //       animate = !animate;
          //     });
          //   }
          // },
          onTap: () {
            setState(() {
              animate = !animate;
            });
          },
          child: Container(
            //slide the card to the left or right based on the user's swipe

            height: 170,
            width: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 5,
                  spreadRadius: .5,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
          )
              .animate(
                autoPlay: false,
                target: animate ? 1 : 0,
              )
              .slideX(
                duration: const Duration(milliseconds: 800),
                //curve: Curves.fastOutSlowIn,
                begin: 0,
                end: -2,
              )
              // .then()
              .slideX(
                duration: const Duration(milliseconds: 800),
                //curve: Curves.fastOutSlowIn,
                // begin: -2,
                end: 0,
              ),
        )
      ],
    );
  }

  Widget myAnimatedAlign() {
    return AnimatedAlign(
      alignment: animate ? Alignment.bottomCenter : Alignment.topRight,
      duration: const Duration(milliseconds: 1700),
      curve: Curves.fastOutSlowIn,
      // heightFactor: 2,
      child: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }

  Widget myAnimatedOpacity() {
    return AnimatedOpacity(
      opacity: animate ? 1 : 0,
      duration: const Duration(seconds: 2),
      curve: Curves.easeIn,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }

  Widget myAnimatedPadding() {
    return AnimatedPadding(
      padding: animate ? const EdgeInsets.all(50) : const EdgeInsets.all(0),
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }

  Widget myAnimatedPositioned() {
    return Center(
      child: Stack(
        //alignment: Alignment.topCenter,
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
            top: animate ? 10 : 80,
            child: Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget myAnimatedDefaultTextStyle() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //a round checkbox
          Checkbox(
            value: animate,
            onChanged: (value) {
              setState(() {
                animate = value!;
              });
            },
          ),
          AnimatedDefaultTextStyle(
            duration: const Duration(microseconds: 1),
            curve: Curves.easeIn,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              decoration:
                  animate ? TextDecoration.lineThrough : TextDecoration.none,
            ),
            child: const Text("Go to the Gym"),
          ),
        ],
      ),
    );
  }
}

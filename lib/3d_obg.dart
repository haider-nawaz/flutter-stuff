import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:o3d/o3d.dart';

class ThreeDExample extends StatefulWidget {
  const ThreeDExample({super.key});

  @override
  State<ThreeDExample> createState() => _ThreeDExampleState();
}

class _ThreeDExampleState extends State<ThreeDExample> {
  O3DController controller = O3DController();
  @override
  Widget build(BuildContext context) {
    return O3D.asset(
      src: "assets/bird.glb",
      controller: controller,
    );
  }
}

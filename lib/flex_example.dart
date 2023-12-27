import 'package:flutter/material.dart';

class FlexExample extends StatefulWidget {
  const FlexExample({super.key});

  @override
  State<FlexExample> createState() => _FlexExampleState();
}

class _FlexExampleState extends State<FlexExample> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Container(
            color: Colors.red,
            height: 100,
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(
            color: Colors.orange,
            height: 100,
          ),
        ),
      ],
    );
  }
}

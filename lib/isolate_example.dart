import 'dart:isolate';

import 'package:flutter/material.dart';

class IsolateExample extends StatefulWidget {
  const IsolateExample({super.key});

  @override
  State<IsolateExample> createState() => _IsolateExampleState();
}

class _IsolateExampleState extends State<IsolateExample> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/Animation.gif"),
          const ElevatedButton(
            onPressed: complexTask,
            child: Text("Complex Task"),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              var receivePort = ReceivePort();
              Isolate.spawn(startIsolate, receivePort.sendPort);

              //listen to the receive port
              receivePort.listen((message) {
                print(message);
              });
            },
            child: const Text("Run With Isolate"),
          )
        ],
      ),
    );
  }
}

void complexTask() {
  //do some complex task here
  var counter = 0;

  for (int i = 0; i < 10000000000; i++) {
    counter++;
  }
  print(counter);
}

startIsolate(SendPort sendPort) {
  //do some complex task here
  var counter = 0;

  for (int i = 0; i < 10000000000; i++) {
    counter++;
  }

  sendPort.send(counter);
}

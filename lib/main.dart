import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ContainerList()
        ),
      ),
    );
  }
}

class ContainerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: .center,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.amber
          )
        ),
        Expanded(
          flex: 3,
          child: Container(
            color: Colors.teal
          )
        ),
        Flexible(
          fit: .loose,
          child: Container(
            color: Colors.pink,
            height: 50,
          )
        ),
      ],
    );
  }
}

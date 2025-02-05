import 'package:flutter/material.dart';

import 'patterns/widgets/patterns_widget.dart';

void main() {
  runApp(const MainWidget());
}

class MainWidget extends StatefulWidget {
  const MainWidget({super.key});

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PatternsWidget(),
    );
  }
}

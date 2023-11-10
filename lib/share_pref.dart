import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class sharePreference extends StatefulWidget {
  const sharePreference({super.key});

  @override
  State<sharePreference> createState() => _sharePreferenceState();
}

class _sharePreferenceState extends State<sharePreference> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SharePreference Demo")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

        ],
      ),
    );
  }
}

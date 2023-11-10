import 'package:flutter/material.dart';

class sharePreference extends StatefulWidget {
  const sharePreference({super.key});

  @override
  State<sharePreference> createState() => _sharePreferenceState();
}

class _sharePreferenceState extends State<sharePreference> {
  int count = 0;
  late TextEditingController _textController;

  @override
  void initState() {
    _textController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("SharePreference Demo"),
          backgroundColor: Colors.blue),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showDialog();
        },
        backgroundColor: Colors.blue,
        elevation: 5,
        splashColor: Colors.grey,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(60.0))),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  void _showDialog() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          backgroundColor: Colors.blue,
          insetPadding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0),
          contentPadding: const EdgeInsets.all(10.0),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          title: const Text("Enter Your Details",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, color: Colors.white)),
          content: SizedBox(
            height: 300,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: TextFormField(
                    controller: _textController,
                    maxLines: 1,
                    autofocus: true,
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      hintText: "Enter your name here",
                      hintStyle: TextStyle(fontSize: 16, color: Colors.white),
                      contentPadding: EdgeInsets.all(10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        borderSide: BorderSide(width: 1, color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide: BorderSide(width: 1, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';

class SharePreference extends StatefulWidget {
  const SharePreference({super.key});

  @override
  State<SharePreference> createState() => _SharePreferenceState();
}

class _SharePreferenceState extends State<SharePreference> {
  int count = 0;
  final  TextEditingController _nameTextController = TextEditingController();
  final  TextEditingController _ageTextController = TextEditingController();

  @override
  void initState() {


    super.initState();
  }

  @override
  void dispose() {
    _nameTextController.dispose();
    _ageTextController.dispose();
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
          clipBehavior: Clip.hardEdge,
          title: const Text("Enter Your Details",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, color: Colors.white)),
          content: SizedBox(
            height: 250,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                 TextField(
                  controller: _nameTextController,
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      hintText: "Enter your name",
                      labelText: "Name"),
                ),
                const SizedBox(
                  height: 12,
                ),
                 TextField(
                  controller: _ageTextController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      hintText: "Enter your age",
                      labelText: "Age"),
                ),
                const SizedBox(height: 30),
                ElevatedButton(onPressed: () {
                  setState(() {
                    print(_nameTextController.text);
                    print(_ageTextController.text);
                  });
                }, child: const Text("Save Info"))
              ],
            ),
          ),
        );
      },
    );
  }
}

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:splash_screen/share_pref.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

class FormValidator extends StatefulWidget {
  @override
  State<FormValidator> createState() => _FormValidatorState();
}

class _FormValidatorState extends State<FormValidator> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _globalkey = GlobalKey<ScaffoldState>();
  final Uri _url = Uri.parse('https://flutter.dev');

  /*void _showMessage(BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("CLicked")));
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalkey,
      drawer: Drawer(),
      appBar: AppBar(
        title: Text("Form Validation"),
        backgroundColor: Colors.blue,
        leading: IconButton(
            onPressed: () {
              _globalkey.currentState?.openDrawer();
            },
            icon: Icon(Icons.menu)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        labelText: "Name",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12)))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter your name";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        labelText: "Age",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12)))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter your Age";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        labelText: "Profession",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12)))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter your profession";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) =>
                                      const SharePreference()));
                        }
                      },
                      child: const Text("Save")),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        _globalkey.currentState!.openDrawer();
                      },
                      child: const Text("Open Drawer")),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        launcher.launchUrl(
                          Uri.parse('https://flutter.dev'),
                          mode: launcher.LaunchMode.externalApplication,
                        );
                      },
                      child: const Text("URL Launcher")),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        launcher.launchUrl(
                          Uri.parse('tel: 01785015347'),
                          mode: launcher.LaunchMode.externalApplication,
                        );
                      },
                      child: const Text("Call")),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        launcher.launchUrl(
                          Uri.parse(
                              'sms: 01785015347${Platform.isAndroid ? '?' : '&'}body=Message from flutter app'),
                          mode: launcher.LaunchMode.externalApplication,
                        );
                      },
                      child: const Text("SMS")),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () async{
                        Uri uri;
                        launcher.launchUrl(
                          uri =   Uri.parse(
                              'mailto: eusuf.cse@gmail.com?subject=Flutter Url Launcher&body=Hi, Flutter developer'),
                          mode: launcher.LaunchMode.externalApplication,
                        );
                        if (!await launcher.launchUrl(uri)) {
                        debugPrint(
                        "Could not launch the uri"); // because the simulator doesn't has the email app
                        }
                      },
                      child: const Text("Email")),
                ],
              ),
            )),
      ),
    );
  }
}

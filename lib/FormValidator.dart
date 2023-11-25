import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:splash_screen/share_pref.dart';

class FormValidator extends StatefulWidget {
  @override
  State<FormValidator> createState() => _FormValidatorState();
}

class _FormValidatorState extends State<FormValidator> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Form Validation"), backgroundColor: Colors.blue),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children:<Widget> [
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      labelText: "Name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12))
                        )
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter your name";
                      }
                    },
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        labelText: "Age",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))
                      )
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter your Age";
                      }
                    },
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      labelText: "Profession",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12))
                        )
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter your profession";
                      }


                    },
                  ),
                  SizedBox(height: 10,),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => const SharePreference()));
                        }
                      },
                      child: const Text("Save"))
                ],
              ),
            )),
      ),
    );
  }
}

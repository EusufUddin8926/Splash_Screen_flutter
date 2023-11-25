import 'dart:convert';
import 'dart:core';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'details.dart';

class SharePreference extends StatefulWidget {
  const SharePreference({super.key});

  @override
  State<SharePreference> createState() => _SharePreferenceState();
}

class _SharePreferenceState extends State<SharePreference> {

  int count = 0;
  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _ageTextController = TextEditingController();
  List<Details> detailsList = [];
  List<String> detailsListString = [];
  late Future<List<Details>> _detailsList;



  Future<void> _insertDetails(Details details) async {
    var getUserList = await _getDetails();
    getUserList.add(details);
    List<String> userStrings = getUserList.map((Details) => Details.toJson()).toList();


    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setStringList('users', userStrings);

    setState(() {
      _detailsList = _getDetails();
    });
  }

  Future<List<Details>> _getDetails() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<String>? userStrings = preferences.getStringList('users');
    if (userStrings != null && userStrings.isNotEmpty) {

// convert json map list to object model lis
      List<Details> users = userStrings.map((userString) => Details.fromJson(userString)).toList();
      return users;
    }else{
      return [];
    }

  }

  @override
  void initState() {
    super.initState();
    _detailsList =  _getDetails();
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
      body: UserList(detailsList: _detailsList),
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

  Future<void> _showDialog() async {
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
            height: 230,
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
                      labelText: "Name", labelStyle: TextStyle(color: Colors.black))
                  ,
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
                      labelText: "Age", labelStyle: TextStyle(color: Colors.black)),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _insertDetails(Details(name: _nameTextController.text,
                            age: _ageTextController.text));
                        _nameTextController.clear();
                        _ageTextController.clear();
                        Navigator.pop(context);
                      });
                    },
                    child: const Text("Save Info"))
              ],
            ),
          ),
        );
      },
    );
  }
}
class UserList extends StatelessWidget {
  late Future<List<Details>> detailsList;
  UserList({required this.detailsList});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: detailsList, builder: (context, snapshot){
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const CircularProgressIndicator();
      } else if (snapshot.hasError) {
        return Text('Error: ${snapshot.error}');
      } else {
        List<Details> users = snapshot.data as List<Details>;

        return ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Name: ${users[index].name}, Age: ${users[index].age}'),
            );
          },
        );
      }
    },
    );
  }
}



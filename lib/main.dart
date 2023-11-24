import 'dart:async';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isValue = false;

  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.push(context as BuildContext, CupertinoPageRoute(builder: (context)=> HomePage()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isValue = !isValue;
          });
        },
        backgroundColor: Colors.blue,
        elevation: 5,
        splashColor: Colors.grey,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(60.0))),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: Container(
        child: FlareActor(
          "animation/Resizing House.flr",
          alignment: Alignment.center,
          fit: BoxFit.cover,
          animation: isValue == false ? "Demo Mode" : "Sun Rotate",
        ),
      ),
    );
  }
}

/*import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User {
  late String name;
  late int age;

  User({required this.name, required this.age});

  Map<String, dynamic> toMap() {
    return {'name': name, 'age': age};
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] as String,
      age: map['age'] as int,
    );
  }

  String toJson() => jsonEncode(toMap());

  factory User.fromJson(String json) => User.fromMap(jsonDecode(json));
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Management'),
      ),
      body: const UserList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddDialog(context),
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddDialog(BuildContext context) {
    String name = "";
    int age = 0;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add User'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) => name = value,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                onChanged: (value) => age = int.tryParse(value) ?? 0,
                decoration: InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                _saveUser(User(name: name, age: age));
                _getUsers();
                Navigator.pop(context);

              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _saveUser(User user) async {
    List<User> users = await _getUsers();
    users.add(user);

    List<String> userStrings = users.map((user) => user.toJson()).toList();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('users', userStrings);
  }

  Future<List<User>> _getUsers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? userStrings = prefs.getStringList('users');

    if (userStrings != null && userStrings.isNotEmpty) {
      List<User> users = userStrings.map((userString) => User.fromJson(userString)).toList();
      return users;
    } else {
      return [];
    }
  }
}

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getUsers(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<User> users = snapshot.data as List<User>;

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


  Future<List<User>> _getUsers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? userStrings = prefs.getStringList('users');

    if (userStrings != null && userStrings.isNotEmpty) {
      List<User> users = userStrings.map((userString) => User.fromJson(userString)).toList();
      return users;
    } else {
      return [];
    }
  }*/


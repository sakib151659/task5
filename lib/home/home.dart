import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../introductionScreen/introductionScreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("home page"),
        actions: [
          IconButton(
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                prefs.setBool('showHome', false);

                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const IntroductionScreen())
                );

          },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: const Center(child: Text("Welcome to Home Page")),
    );
  }
}

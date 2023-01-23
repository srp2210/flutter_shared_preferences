import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomeSharedPage extends StatefulWidget {
  const MyHomeSharedPage({super.key});

  @override
  State<MyHomeSharedPage> createState() => _MyHomeSharedPageState();
}

class _MyHomeSharedPageState extends State<MyHomeSharedPage> {
  TextEditingController textEditingController = TextEditingController();

  void saveTxt(String text) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("text", text);
  }

  void readTxt() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedvalue = prefs.getString("text");
    if (savedvalue != null) {
      textEditingController.text = savedvalue;
    }
  }

  @override
  void initState() {
    readTxt();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SharedPreferences'),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('SharedPrederences'),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: textEditingController,
              decoration:
                  const InputDecoration(labelText: 'Enter text to save'),
              onChanged: (value) {
                saveTxt(value);
              },
            ),
          ],
        ),
      )),
    );
  }
}

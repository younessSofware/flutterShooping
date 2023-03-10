import 'package:flutter/material.dart';

class UsersPage extends StatelessWidget {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('users')),
      drawer: const Drawer(),
      body: Column(children: [
        Row(
          children: [
            Expanded(
              child: Container(
                child: TextFormField(
                  controller: textEditingController,
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.visibility),
                      contentPadding: EdgeInsets.only(left: 20),
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.deepOrange, width: 1),
                          borderRadius: BorderRadius.circular(50))),
                ),
                padding: EdgeInsets.all(10),
              ),
            ),
            IconButton(
                onPressed: () {
                  print(textEditingController.text);
                },
                icon: Icon(Icons.search, color: Colors.deepOrange))
          ],
        )
      ]),
    );
  }
}

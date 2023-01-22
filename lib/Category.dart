import 'package:flutter/material.dart';
import './QuestionsPage.dart';

class Category extends StatelessWidget {
  final List selectedItem;
  const Category({super.key, required this.selectedItem});

  @override
  Widget build(BuildContext context) {
    const List category = [
      ["History", 23],
      ["Sports", 21],
      ["Mythology", 20],
      ["Celebrities", 26],
      ["Art", 25]
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Category"),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 50),
        decoration: const BoxDecoration(color: Color.fromRGBO(33, 40, 73, 100)),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: const Text(
                "Select the topic:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: category.length,
              itemBuilder: (BuildContext context, int index) {
                return ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: () {
                    selectedItem.add(category[index][1]);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return QuestionsDisp(selectedItem: selectedItem);
                    }));
                  },
                  child: Text(category[index][0],
                      style: const TextStyle(fontSize: 18)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

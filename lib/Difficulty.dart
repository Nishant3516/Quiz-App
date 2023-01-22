import 'package:flutter/material.dart';
import 'Category.dart';

class Difficulty extends StatelessWidget {
  const Difficulty({super.key});

  @override
  Widget build(BuildContext context) {
    const List<String> diff = ["Easy", "Medium", "Hard"];
    final List selectedItem = [];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Dificulty"),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
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
                "Select the difficulty:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListView.builder(
              itemCount: diff.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  onPressed: () {
                    selectedItem.add(diff[index]);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Category(
                        selectedItem: selectedItem,
                      );
                    }));
                  },
                  child: Text(
                    diff[index],
                    style: const TextStyle(fontSize: 18),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

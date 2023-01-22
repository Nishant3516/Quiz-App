import 'package:flutter/material.dart';
import './Difficulty.dart';

class ScorePage extends StatelessWidget {
  final int score;
  final nextPage;
  const ScorePage({super.key, required this.score, required this.nextPage});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Text(
                "Your score is $score",
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            ElevatedButton(
                onPressed: nextPage, child: const Text("Click to Replay"))
          ]),
    );
  }
}

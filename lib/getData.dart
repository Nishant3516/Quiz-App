import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';

class Question {
  final String question;
  final String correctAns;
  final List<String> options;
  Question(
      {required this.question,
      required this.correctAns,
      required this.options});
}

List<String> shuffle(List<String> items) {
  var random = new Random();

  // Go through all elements.
  for (var i = items.length - 1; i > 0; i--) {
    // Pick a pseudorandom number according to the list length
    var n = random.nextInt(i + 1);

    var temp = items[i];
    items[i] = items[n];
    items[n] = temp;
  }

  return items;
}

List<Question> finalQues = [];
Future<List> getQues(List selectedItem) async {
  String url =
      "https://opentdb.com/api.php?amount=10&category=${selectedItem[1]}&difficulty=${selectedItem[0].toString().toLowerCase()}&type=multiple";
  final response = await http.get(Uri.parse(url));
  var responseData = json.decode(response.body);
  for (var eachques in responseData["results"]) {
    List<String> tempOptions = [
      eachques["correct_answer"],
      ...eachques["incorrect_answers"]
    ];
    List<String> finalOptions = shuffle(tempOptions);
    Question ques = Question(
        question: eachques["question"],
        correctAns: eachques["correct_answer"],
        options: finalOptions);
    finalQues.add(ques);
  }

  return finalQues;
}

import 'package:flutter/material.dart';
import 'package:tryapp/ScorePage.dart';
import './Difficulty.dart';
import './indOption.dart';
import './getData.dart';

class QuestionsDisp extends StatefulWidget {
  List selectedItem;
  QuestionsDisp({super.key, required this.selectedItem});

  @override
  State<QuestionsDisp> createState() => _QuestionsDispState();
}

int num = 0, score = 0, indVal = 0;

class _QuestionsDispState extends State<QuestionsDisp> {
  void nextQues(String selectedOption) {
    setState(
      () {
        num += 1;
        (finalQues[indVal].correctAns == selectedOption)
            ? score += 10
            : score += 0;
        indVal += 1;
      },
    );
  }

  void nextPage() {
    setState(() {
      num = score = indVal = 0;
      widget.selectedItem = [];
    });
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const Difficulty();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Questions"),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 50),
        decoration: const BoxDecoration(color: Color.fromRGBO(33, 40, 73, 100)),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        child: FutureBuilder(
          future: getQues(widget.selectedItem),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    "Loading...",
                    style: TextStyle(fontSize: 18),
                  ),
                  Text("Please check your Internet connectivity!!",
                      style: TextStyle(fontSize: 18)),
                ],
              );
            } else {
              return (num >= 10)
                  ? ScorePage(score: score, nextPage: nextPage)
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          child: Text(
                            finalQues[indVal].question,
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: finalQues[indVal].options.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                  child: indOption(
                                      nextQues: () => nextQues(
                                          finalQues[indVal].options[index]),
                                      optionVal:
                                          finalQues[indVal].options[index]));
                            },
                          ),
                        )
                      ],
                    );
            }
          },
        ),
      ),
    );
  }
}

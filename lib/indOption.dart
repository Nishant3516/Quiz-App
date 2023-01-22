import 'package:flutter/material.dart';

class indOption extends StatelessWidget {
  final nextQues;
  final String optionVal;
  const indOption({super.key, required this.nextQues, required this.optionVal});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            side: const BorderSide(
              width: 2,
            ),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            )),
        onPressed: nextQues,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Text(
            optionVal,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
        ));
  }
}

import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final void Function() questionText;
  final String text;
  Answer(this.questionText, this.text, { Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity / 2,
      child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
              ),
              onPressed: questionText, 
              child: Text(
                text, 
                style: TextStyle(
                  color: Colors.white,
                ),
              )
            ),
    );
  }
}
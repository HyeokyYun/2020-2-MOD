import 'package:flutter/material.dart';
import 'package:quizmaker_app/widget/widgets.dart';

class Results extends StatefulWidget {
  final int correct, incorrect, total;
  Results(
      {@required this.correct, @required this.incorrect, @required this.total});
  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${widget.correct}/${widget.total}",
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Correct: ${widget.correct}\n"
                "Incorrect: ${widget.incorrect}",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 15,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: blueButton(
                      context: context,
                      label: "Go to Home",
                      buttonWidth: MediaQuery.of(context).size.width / 2))
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:quizzler_app/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(Quizzler());
}

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizzlerPage(),
          ),
        ),
      ),
    );
  }
}

class QuizzlerPage extends StatefulWidget {
  @override
  State<QuizzlerPage> createState() => _QuizzlerPageState();
}

class _QuizzlerPageState extends State<QuizzlerPage> {

  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userAnswer) {
    setState(() {
      bool isFinished = quizBrain.isFinished();
      if (isFinished) {
        Alert(
          context: context,
          title: "The end",
          desc: "Congratulations! You have passed the quiz",
        ).show();
        scoreKeeper = [];
        quizBrain.reset();
      } else {
        bool correctAnswer = quizBrain.getAnswer();
        if (correctAnswer == userAnswer) {
          scoreKeeper.add(
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          scoreKeeper.add(
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
        quizBrain.nextQuestionNumber();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestion(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              child: Container(
                color: Colors.green,
                child: Center(
                  child: Text(
                    'True',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              onPressed: () {
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              child: Container(
                color: Colors.red,
                child: Center(
                  child: Text(
                    'False',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              onPressed: () {
                checkAnswer(false);
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
        // ElevatedButton(
        //   child: Text('Basic Alert'),
        //   onPressed: () {
        //     print('ElevatedButton got pressed');
        //     Alert(
        //       context: context,
        //       title: "RFLUTTER ALERT",
        //       desc: "Flutter is more awesome with RFlutter Alert.",
        //     ).show();
        //   },
        // ),
      ],
    );
  }
}

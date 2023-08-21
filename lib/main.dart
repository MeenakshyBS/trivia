import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
//import 'question.dart';
import 'quiz_brain.dart';
QuizBrain quizBrain = QuizBrain();//new obj of the class
//importing the class we created inside lib!!
void main() => runApp(Trivia());

class Trivia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: TriviaPage(),
          ),
        ),
      ),
    );
  }
}

class TriviaPage extends StatefulWidget {
  @override
  _TriviaPageState createState() => _TriviaPageState();
}

class _TriviaPageState extends State<TriviaPage> {
  List<Icon> scoreKeeper = [

  ];
  void checkAnswer(bool userPickedAnswer){
    if (quizBrain.isFinished()) {
     // print("Quiz is finished. Ready to restart!");
     // Alert(context: context, title: "End Of Trivia!", desc: "").show();
      Alert(context: context, title: "End Of Trivia!", desc: "").show().then((value) {
        setState(() {
          scoreKeeper = [];
          quizBrain.reset();
        });
      });
    } /*else {
      print("Quiz is not finished yet.");
    }*/
    bool correctAnswer = quizBrain.getQuestionAnswer();
    setState(() {
    if(userPickedAnswer == correctAnswer){
      scoreKeeper.add(Icon(Icons.check,color:Colors.green));
    }else{
      scoreKeeper.add(Icon(Icons.close,color:Colors.red));
    }

    // The user picked true.

      quizBrain.nextQuestion();
    });


  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child:TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checkAnswer(true);

                // The user picked true.


              },

            )
            ,
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              child: Text(
                'False',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                // The user picked false.
               checkAnswer(false);

              },

            )
            ,
          ),
        ),
        Row(
          //children has list<widget> nd socrekeeper has list<dynamic>
          children: scoreKeeper,
        ),

      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/

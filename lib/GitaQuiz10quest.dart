//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/question_data/GitaQuiz.dart';
import 'package:flutter_application_1/question_data/englishquiz.dart';
import 'package:flutter_application_1/result.dart';

import 'FirstScreen.dart';

import 'question_data/quest.dart';

//import 'package:http/http.dart';

// import 'package:intl/intl.dart';

// this returns the last date of the month using DateTime

class GitaQuiz10quest extends StatefulWidget {
  int maxLimit;
  String Qid;
  bool rig;
  bool showscore;

  GitaQuiz10quest(this.maxLimit, this.Qid, this.rig, this.showscore);

  @override
  _GitaQuiz10questState createState() => _GitaQuiz10questState();

  //static indexof(Map category) {}
}

class _GitaQuiz10questState extends State<GitaQuiz10quest> {
//DateTime now = new DateTime.now();
  // ignore: unused_field
  static final DateTime now = DateTime.now();
  // -------------  hema --------------
  // String formattedDate = DateFormat('dd-MM').format(now);
  var currentIndex = 0;

  //static final now = DateTime.now();
  //final lastDayOfMonth = DateTime(0, now.month, now.day);

  static List<dynamic> item = [];
  List<dynamic> items = [];
  //var parsedDate = DateTime.parse(item[currentIndex]['questionDate']);
  @override
  void initState() {
    super.initState();
    if (widget.Qid == "GitaQuiz") {
      item = Questions1.questions1;
    } else if (widget.Qid == "EnglishQuiz") {
      item = Questions2.questions2;
    } else if (widget.Qid == "Others") {
      item = Questions.questions;
    }

    items = item.sublist(0, widget.maxLimit)..shuffle();
  }

  dynamic rightAnswerCount = 0;
  var wrongAnswerCount = 0;

  validateAnswer(userInput) {
    {
      if (currentIndex >= widget.maxLimit - 1) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => widget.showscore == true
                  ? Result(rightAnswerCount)
                  : FirstHomeScreen()),
        );
      }

      // if (userInput == items[currentIndex]['answers']) {
      //   setState(() {
      //    rightAnswerCount=currentIndex;
      //   });
      // }

      if (userInput == items[currentIndex]['answers']) {
        setState(() {
          rightAnswerCount += 1;

          currentIndex += 1;
        });
      } else {
        setState(() {
          wrongAnswerCount += 1;
          currentIndex += 1;
        });
      }
    }
  }

  reset() {
    setState(() {
      rightAnswerCount = 0;
      wrongAnswerCount = 0;
      currentIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        backgroundColor: Colors.blueGrey[100],
        appBar: AppBar(
          title: Text('Quiz'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: double.infinity,
                      color: Colors.white,
                      margin: EdgeInsets.all(8),
                      padding: EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Text(
                            //            currentDate questionDate
                            '${items[currentIndex]['question']}',
                            style: TextStyle(
                              fontSize: 24,
                            ),
                            textAlign: TextAlign.center,
                          ),

                          Container(
                            width: 360,
                            height: 40,
                            decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(25)),
                            margin: EdgeInsets.all(25),
                            child: OutlineButton(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('${items[currentIndex]['opt1']}',
                                    style: TextStyle(color: Colors.red)),
                              ),
                              highlightedBorderColor: Colors.red,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              onPressed: () {
                                validateAnswer(items[currentIndex]['opt1']);
                              },
                            ),
                          ),
                          // Container(
                          //   decoration: BoxDecoration(
                          //       border: Border.all(),
                          //       borderRadius: BorderRadius.circular(25)),
                          //   width: 360,
                          //   height: 40,
                          //   margin: EdgeInsets.only(bottom: 10, top: 10),
                          //   child: Container(
                          //     padding: EdgeInsets.all(4),
                          //     child: ElevatedButton(
                          //         style: ElevatedButton.styleFrom(
                          //             primary: Colors.white, elevation: 0),
                          //         onPressed: () {
                          //           validateAnswer(items[currentIndex]['opt1']);
                          //         },
                          //         child: Text('${items[currentIndex]['opt1']}',
                          //             style: TextStyle(color: Colors.red))),
                          //   ),
                          // ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(25)),
                            width: 360,
                            height: 40,
                            margin: EdgeInsets.only(bottom: 10, top: 10),
                            child: Container(
                              padding: EdgeInsets.all(4),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      visualDensity: VisualDensity(),
                                      primary: Colors.white,
                                      elevation: 0),
                                  onPressed: () {
                                    validateAnswer(items[currentIndex]['opt2']);
                                  },
                                  child: Text('${items[currentIndex]['opt2']}',
                                      style: TextStyle(color: Colors.red))),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(25)),
                            width: 360,
                            height: 40,
                            margin: EdgeInsets.only(bottom: 10, top: 10),
                            child: Container(
                              padding: EdgeInsets.all(4),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.white, elevation: 0),
                                  onPressed: () {
                                    validateAnswer(items[currentIndex]['opt3']);
                                  },
                                  child: Text('${items[currentIndex]['opt3']}',
                                      style: TextStyle(color: Colors.red))),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(25)),
                            width: 360,
                            height: 40,
                            margin: EdgeInsets.only(bottom: 10, top: 10),
                            child: Container(
                              padding: EdgeInsets.all(4),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.white, elevation: 0),
                                  onPressed: () {
                                    validateAnswer(items[currentIndex]['opt4']);
                                  },
                                  child: Text('${items[currentIndex]['opt4']}',
                                      style: TextStyle(color: Colors.red))),
                            ),
                          ),
                          // Container(
                          //   decoration: BoxDecoration(
                          //       border: Border.all(),
                          //       borderRadius: BorderRadius.circular(25)),
                          //   width: 360,
                          //   height: 40,
                          //   margin: EdgeInsets.only(bottom: 10, top: 10),
                          //   child: ElevatedButton(
                          //       style: ElevatedButton.styleFrom(
                          //           primary: Colors.transparent, elevation: 0),
                          //       onPressed: () {
                          //         validateAnswer(
                          //             questions[currentIndex]['option5']);
                          //       },
                          //       child: Text(
                          //           '${questions[currentIndex]['option5']}',
                          //           style: TextStyle(color: Colors.red))),
                          // ),
                        ],
                      )),

                  // ElevatedButton(
                  //     onPressed: () {},
                  //     child: Text('${questions[currentIndex]['opt4']}')),
                  SizedBox(
                    height: 20,
                  ),
                  Visibility(
                    visible: widget.rig,
                    child: Text(
                      // ignore: unnecessary_brace_in_string_interps
                      "Total: ${items.length} - Right: ${rightAnswerCount} Wrong: ${wrongAnswerCount}",
                      style:
                          TextStyle(color: Colors.redAccent[900], fontSize: 22),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      reset();
                    },
                    child: Text(
                      "Reset",
                      style: TextStyle(color: Colors.red[900], fontSize: 22),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

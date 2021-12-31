import 'package:flutter/material.dart';

import 'FirstScreen.dart';

class Result extends StatelessWidget {
  final int resultScore;

  Result(
    this.resultScore,
  );

  resultPhrase() {
    String resultText;
    if (resultScore <= 20) {
      resultText = 'You are Bad! Result Score:$resultScore';
    } else if (resultScore <= 30) {
      resultText = 'You are Good! Result Score:$resultScore';
    } else if (resultScore <= 40) {
      resultText = 'You are Great! Result Score:$resultScore';
    } else {
      resultText = 'You are awasome! Result Score:$resultScore';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase(),
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text(
              'Restart Quiz!',
            ),
            textColor: Colors.blue,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FirstHomeScreen()),
              );
            },
          )
        ],
      ),
    );
  }
}

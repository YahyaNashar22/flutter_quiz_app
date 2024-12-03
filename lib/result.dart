import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';

class Result extends StatelessWidget {
  const Result(this.selectedAnswers, this.restart, {super.key});

  final List<String> selectedAnswers;
  final void Function() restart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        "question_index": i,
        "question": questions[i].text,
        "correct_answer": questions[i].answers[0],
        "user_answer": selectedAnswers[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    int numOfCorrectAnswers = summaryData
        .where((element) => element["user_answer"] == element["correct_answer"])
        .length;

    // * the below code block is replaced by the "Where" statement above.
    // for (var i = 0; i < summaryData.length; i++) {
    //   if (summaryData[i]["user_answer"] == summaryData[i]["correct_answer"]) {
    //     numOfCorrectAnswers++;
    //   }
    // }

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "You answered $numOfCorrectAnswers out of ${questions.length} questions correctly!",
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 118, 87, 0),
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          SizedBox(
            height: 450,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ...summaryData.map((e) => Column(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 16,
                                backgroundColor:
                                    e["user_answer"] == e["correct_answer"]
                                        ? Colors.green
                                        : Colors.red,
                                child: Text(((e["question_index"] as int) + 1)
                                    .toString()),
                              ),
                              const SizedBox(width: 15),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      e["question"].toString(),
                                      style: const TextStyle(
                                        color: Color.fromARGB(255, 118, 87, 0),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Your answer: ${e["user_answer"].toString()}",
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                    Text(
                                      "Correct answer: ${e["correct_answer"].toString()}",
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          )
                        ],
                      ))
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
          TextButton.icon(
            style: TextButton.styleFrom(iconColor: Colors.white),
            onPressed: restart,
            icon: const Icon(Icons.restart_alt_outlined),
            label: const Text(
              "Restart Quiz!",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}

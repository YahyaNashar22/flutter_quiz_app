import 'package:quiz_app/models/QuizQuestion.dart';

const List<QuizQuestion> questions = [
  QuizQuestion("What are the main building blocks of Flutter UI?",
      ["Widgets", "Components", "Blocks", "Functions"]),
  QuizQuestion("How do you start a new Flutter project from the CLI?", [
    "flutter create flutter_app",
    "flutter run",
    "npx create flutter_app",
    "npm run start flutter _app"
  ]),
  QuizQuestion("What is Flutter?", [
    "Flutter is an open-source UI toolkit",
    "Flutter is an open-source programming language for cross-platform applications",
    "Flutter is an open-source backend development framework",
    "Flutters is a DBMS toolkit"
  ]),
  QuizQuestion(
      "Who developed the Flutter Framework and continues to maintain it today?",
      ["Google", "Microsoft", "Facebook", "Oracle"]),
  QuizQuestion(
      "Which programming language is used to build Flutter applications?",
      ["Dart", "Kotlin", "Java", "Go"]),
  QuizQuestion(
      "How many types of widgets are there in Flutter?", ["2", "4", "6", "8+"])
];

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home(this.switchScreen, {super.key});

  final void Function() switchScreen;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            width: 300,
            color: const Color.fromARGB(255, 118, 87, 0),
          ),
          const SizedBox(height: 80),
          const Text(
            "Learn Flutter",
            style: TextStyle(
              fontSize: 24.0,
              color: Color.fromARGB(255, 118, 87, 0),
            ),
          ),
          const SizedBox(height: 50),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromARGB(255, 137, 124, 0),
            ),
            onPressed: switchScreen,
            label: const Text("Start Quiz"),
            icon: const Icon(Icons.arrow_outward_outlined),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz,{super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.deepPurple,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
              Image.asset(
                'assets/logo.png',
                width: 180,
              ),
              const SizedBox(height: 30), 
              const Text(
                'Learn Flutter the fun way!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold, 
                  color:Colors.white,
                ),
              ),
              const SizedBox(height:30),
              ElevatedButton(onPressed: startQuiz, 
                child: const Text(
                  'Start Quiz',
                  style: TextStyle(
                    fontSize: 18,
                  )
                )
              )
          ],
        ),
      ),
    );
  }
}
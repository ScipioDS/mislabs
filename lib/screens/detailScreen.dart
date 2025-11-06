import 'package:flutter/material.dart';

import '../models/exam.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, exam = Exam});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Screen'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Center(
        child: Text(
          'This is the detail screen!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
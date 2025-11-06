import 'package:flutter/material.dart';

import '../models/exam.dart';

class DetailScreen extends StatelessWidget {
  final Exam exam;

  const DetailScreen({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    bool passed = exam.date.compareTo(DateTime.timestamp()) < 0;
    String passedString = passed ? 'Passed' : '';
    Color background = passed ? Colors.red : Theme.of(context).colorScheme.inversePrimary;

    return Scaffold(
      appBar: AppBar(
        title: Text(exam.title),
        backgroundColor: background,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              exam.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.calendar_month),
                Container(
                  margin: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    'Датум: ${exam.date.day}.${exam.date.month}.${exam.date.year} $passedString',
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.access_time),
                Container(
                  margin: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    'Време: ${exam.date.hour}:${exam.date.minute.toString().padLeft(2, '0')}',
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Row(
              children: [
                const Icon(Icons.room),
                const Text(
                  'Соби:',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            ...exam.rooms.map((room) => Text(' - $room', style: const TextStyle(fontSize: 16))),
          ],
        ),
      ),
    );
  }
}
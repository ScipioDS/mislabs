import 'package:flutter/material.dart';
import 'package:mislabs/screens/detailScreen.dart';

import 'models/exam.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const MyHomePage(title: 'Распоред за испити - 221171'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Hardcoded list of exams
  List<Exam> exams = [
    Exam(
      title: 'Мобилни Информациски Системи',
      date: DateTime(2025, 1, 15, 10, 0),
      rooms: ['101', '102', '103'],
    ),
    Exam(
      title: 'Веб Програмирање',
      date: DateTime(2025, 1, 18, 14, 0),
      rooms: ['201', '202'],
    ),
    Exam(
      title: 'Бази на Податоци',
      date: DateTime(2025, 1, 20, 9, 0),
      rooms: ['305'],
    ),
    Exam(
      title: 'Оперативни Системи',
      date: DateTime(2025, 1, 22, 11, 0),
      rooms: ['104', '105'],
    ),
    Exam(
      title: 'Алгоритми и Податочни Структури',
      date: DateTime(2025, 1, 25, 13, 0),
      rooms: ['301', '302'],
    ),
    Exam(
      title: 'Софтверско Инженерство',
      date: DateTime(2025, 1, 27, 10, 0),
      rooms: ['203'],
    ),
    Exam(
      title: 'Вештачка Интелигенција',
      date: DateTime(2025, 2, 1, 15, 0),
      rooms: ['401', '402'],
    ),
    Exam(
      title: 'Компјутерски Мрежи',
      date: DateTime(2025, 2, 3, 9, 0),
      rooms: ['205', '206'],
    ),
    Exam(
      title: 'Дискретна Математика',
      date: DateTime(2025, 2, 5, 12, 0),
      rooms: ['307'],
    ),
    Exam(
      title: 'Програмски Јазици',
      date: DateTime(2025, 2, 8, 14, 0),
      rooms: ['108', '109', '110'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double containerWidth = screenWidth * 0.9;
    double containerHeight = screenHeight * 0.15;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: exams.length,
        itemBuilder: (context, index) {
          final exam = exams[index];

          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Card(
              clipBehavior: Clip.hardEdge,
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(exam: exam),
                    ),
                  );
                },
                child: SizedBox(
                  width: containerWidth,
                  height: containerHeight,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          exam.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '${exam.date.day}.${exam.date.month}.${exam.date.year} - ${exam.date.hour}:${exam.date.minute.toString().padLeft(2, '0')}',
                          style: const TextStyle(fontSize: 14),
                        ),
                        Text(
                          'Соби: ${exam.rooms.join(", ")}',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
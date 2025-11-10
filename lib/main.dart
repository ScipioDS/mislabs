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
      date: DateTime(2025, 10, 15, 10, 0),
      rooms: ['101', '102', '103'],
    ),
    Exam(
      title: 'Веб Програмирање',
      date: DateTime(2025, 10, 18, 14, 0),
      rooms: ['201', '202'],
    ),
    Exam(
      title: 'Бази на Податоци',
      date: DateTime(2025, 11, 20, 9, 0),
      rooms: ['305'],
    ),
    Exam(
      title: 'Оперативни Системи',
      date: DateTime(2025, 11, 22, 11, 0),
      rooms: ['104', '105'],
    ),
    Exam(
      title: 'Алгоритми и Податочни Структури',
      date: DateTime(2025, 11, 25, 13, 0),
      rooms: ['301', '302'],
    ),
    Exam(
      title: 'Софтверско Инженерство',
      date: DateTime(2025, 11, 27, 10, 0),
      rooms: ['203'],
    ),
    Exam(
      title: 'Вештачка Интелигенција',
      date: DateTime(2025, 12, 1, 15, 0),
      rooms: ['401', '402'],
    ),
    Exam(
      title: 'Компјутерски Мрежи',
      date: DateTime(2025, 12, 3, 9, 0),
      rooms: ['205', '206'],
    ),
    Exam(
      title: 'Дискретна Математика',
      date: DateTime(2025, 12, 5, 12, 0),
      rooms: ['307'],
    ),
    Exam(
      title: 'Програмски Јазици',
      date: DateTime(2025, 12, 8, 14, 0),
      rooms: ['108', '109', '110'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double containerWidth = screenWidth * 0.9;
    double containerHeight = screenHeight * 0.2;

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
              color: exam.date.isBefore(DateTime.now())
                  ? Colors.grey[300]
                  : null, // null uses default card color
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
                        Row(
                          children: [
                            Icon(Icons.access_time, size: 16,),
                            SizedBox(width: 5,),
                            Text(
                              '${exam.date.day}.${exam.date.month}.${exam.date.year} - ${exam.date.hour}:${exam.date.minute.toString().padLeft(2, '0')}',
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.desktop_windows, size: 16,),
                            SizedBox(width: 5,),
                            Text(
                              'Соби: ${exam.rooms.join(", ")}',
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
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
      floatingActionButton: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.list_alt,
              color: Colors.white,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              'Вкупно испити: ${exams.length}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
import 'package:flutter/material.dart';

class SeatPage extends StatelessWidget {
  SeatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    String departure = args['departureStation'] ?? '';
    String arrival = args['arrivalStation'] ?? '';
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('좌석 선택'))),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80),
        child: Column(
          children: [
            row(1),
            row(2),
            row(3),
            row(4),
            row(5),
            row(6),
            row(7),
            row(8),
            row(9),
            row(10),
          ],
        ),
      ),
    );
  }

  Row row(int row) {
    return Row(
      children: [
        seat(row, 'A'),
        seat(row, 'B'),
        number(row.toString()),
        seat(row, 'C'),
        seat(row, 'D'),
      ],
    );
  }

  Expanded seat(int row, String col) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1,
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: Container(
            height: 36,
            width: 36,
            decoration: BoxDecoration(
              color: Colors.grey[350],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }

  Expanded number(String num) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1,
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: Container(child: Center(child: Text(num))),
        ),
      ),
    );
  }
}

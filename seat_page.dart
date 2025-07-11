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
      body: Center(
        child: AspectRatio(
          aspectRatio: 1,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //왼쪽 좌석 2칸
                Expanded(
                  child: Container(
                    height: 36,
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 36,
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                //좌석 숫자(중간)
                Expanded(
                  child: Container(
                    height: 36,
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    child: Center(child: Text('1')),
                  ),
                ),

                //오른쪽 좌석 2칸
                Expanded(
                  child: Container(
                    height: 36,
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 36,
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
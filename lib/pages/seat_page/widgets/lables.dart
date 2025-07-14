//출발역 -> 도착역 레이블 위젯
import 'package:flutter/material.dart';

class departureToArrival extends StatelessWidget {
  const departureToArrival({
    super.key,
    required this.departure,
    required this.arrival,
  });

  final String departure;
  final String arrival;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        children: [
          //출발역
          Expanded(
            child: Center(
              child: Text(
                departure,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          //화살표 아이콘
          Expanded(child: Icon(Icons.arrow_circle_right_outlined, size: 30)),

          // 도착역
          Expanded(
            child: Center(
              child: Text(
                arrival,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//출발역 -> 도착역 레이블 위젯
import 'package:flutter/material.dart';

class DepartureToArrival extends StatelessWidget {
  const DepartureToArrival({
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

//선택됨 및 선택 안 됨 표시
Row coloredLabel(Color color, String text) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      //선택됨
      Row(
        children: [
          Container(
            height: 24,
            width: 24,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          SizedBox(width: 4),
          Text(text),
        ],
      ),
    ],
  );
}

//ABCD레이블 표시
Widget labelForRow(String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4),
    child: Container(
      height: 50,
      width: 50,
      child: Center(child: Text(text, style: TextStyle(fontSize: 18))),
    ),
  );
}

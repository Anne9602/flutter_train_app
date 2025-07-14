import 'package:flutter/material.dart';

//좌석선택 버튼 위젯 구현

class SeatChoiceButton extends StatelessWidget {
  SeatChoiceButton(this.departureStation, this.arrivalStation, {super.key});

  String? departureStation;
  String? arrivalStation;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: () {
          // 좌석 선택 버튼 클릭 시 seat page로 이동
          Navigator.pushNamed(
            context,
            '/seatpage',
            arguments: {
              'departureStation': departureStation ?? '',
              'arrivalStation': arrivalStation ?? '',
            },
          );
        },
        child: Text(
          '좌석 선택',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

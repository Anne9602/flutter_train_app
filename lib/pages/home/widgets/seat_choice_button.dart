import 'package:flutter/cupertino.dart';
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
          try {
            //출발역 또는 도착역이 널값인 경우
            if (departureStation == null || arrivalStation == null) {
              showCupertinoDialog(
                context: context,
                builder: (context) {
                  return CupertinoAlertDialog(
                    title: Text('잠깐!'),
                    content: Text('출발역 또는 도착역의 값이 비어있습니다.'),
                    actions: [
                      CupertinoDialogAction(
                        child: Text('확인'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
              return;
            }
            // 좌석 선택 버튼 클릭 시 seat page로 이동
            Navigator.pushNamed(
              context,
              '/seatpage',
              arguments: {
                'departureStation': departureStation,
                'arrivalStation': arrivalStation,
              },
            );
          } catch (e) {
            showCupertinoDialog(
              context: context,
              builder: (context) {
                return CupertinoAlertDialog(
                  title: Text('페이지 이동 중 에러가 발생했습니다. \n 잠시 후에 이용해주세요.'),
                  actions: [
                    CupertinoDialogAction(
                      child: Text('확인'),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                );
              },
            );
          }
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

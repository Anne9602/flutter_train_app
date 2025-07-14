import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_train_app/pages/seat_page/widgets/button.dart';
import 'package:flutter_train_app/pages/seat_page/widgets/labels.dart';

//좌석 선택 페이지

class SeatPage extends StatefulWidget {
  SeatPage({super.key});

  @override
  State<SeatPage> createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  int? selectedRow;
  String? selectedCol;

  @override
  Widget build(BuildContext context) {
    //출발역과 도착역 인자 정보 받기
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String?>;
    String departure = args['departureStation'] ?? '';
    String arrival = args['arrivalStation'] ?? '';

    return Scaffold(
      appBar: AppBar(title: Center(child: Text('좌석 선택'))),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(height: 10),

            //출발역 -> 도착역 표시
            DepartureToArrival(departure: departure, arrival: arrival),
            SizedBox(height: 10),

            //선택됨 및 선택 안 됨 표시
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                coloredLabel(Colors.purple, '선택됨'),
                SizedBox(width: 20),
                coloredLabel(Theme.of(context).dividerColor, '선택 안 됨'),
              ],
            ),

            //좌석 선택(
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: ListView(
                  children: [
                    //ABCD 행 레이블 표시
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        labelForRow('A'),
                        labelForRow('B'),
                        labelForRow(''),
                        labelForRow('C'),
                        labelForRow('D'),
                      ],
                    ),
                    SizedBox(height: 10), // 레이블과 좌석 사이 간격
                    for (int i = 0; i < 20; i++) row(i + 1), //열 넘버 부여
                  ],
                ),
              ),
            ),

            //예매하기 버튼
            reservation_button(context, selectedRow, selectedCol),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  //행 넘버 부여
  Row row(int row) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        seat(row, 'A'),
        seat(row, 'B'),
        number(row.toString()),
        seat(row, 'C'),
        seat(row, 'D'),
      ],
    );
  }

  //좌석 넘버 부여
  Widget number(String num) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      child: Container(
        height: 50,
        width: 50,
        child: Center(child: Text(num, style: TextStyle(fontSize: 18))),
      ),
    );
  }

  //좌석 그리기
  Widget seat(int row, String col) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedRow = row;
            selectedCol = col;
          });
        },
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            //클릭한 row,col의 도형 색칠하기
            color:
                selectedRow == row && selectedCol == col
                    ? Colors.purple
                    : Theme.of(context).dividerColor,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}

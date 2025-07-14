import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_train_app/pages/seat_page/widgets/lables.dart';

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
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
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
            departureToArrival(departure: departure, arrival: arrival),
            SizedBox(height: 10),
            //선택됨 및 선택 안 됨 표시
            lable(),
            //ABCD레이블
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                lableforLow('A'),
                lableforLow('B'),
                lableforLow(''),
                lableforLow('C'),
                lableforLow('D'),
              ],
            ),

            //좌석 선택(
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: ListView(
                  children: [for (int i = 0; i < 20; i++) row(i + 1)],
                ),
              ),
            ),

            //예매하기 버튼
            reservation_button(context),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  SizedBox reservation_button(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: () {
          //선택된 좌석이 없으면 아무반응 x, 있으면 터치시 팝업 구현
          if (selectedCol == null && selectedRow == null) {
            return;
          } else {
            showCupertinoDialog(
              context: context,
              builder: (context) {
                return CupertinoAlertDialog(
                  title: Text('예매 하시겠습니까?'),
                  content: Text('좌석: $selectedRow - $selectedCol'),
                  actions: [
                    CupertinoDialogAction(
                      isDestructiveAction: true,
                      onPressed: () {
                        //취소 클릭시의 버튼 구현
                        Navigator.of(context).pop();
                      },
                      child: Text('취소'),
                    ),
                    CupertinoDialogAction(
                      isDefaultAction: true,

                      child: Text(
                        '확인',
                        style: TextStyle(color: CupertinoColors.activeBlue),
                      ),

                      onPressed: () {
                        //확인 클릭시의 버튼 구현
                        Navigator.of(context).pop();
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          '/',
                          (route) => false,
                        );
                      },
                    ),
                  ],
                );
              },
            );
          }
        },
        child: Text(
          '예매하기',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  //ABCD레이블 표시
  Widget lableforLow(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Container(
        height: 50,
        width: 50,
        child: Center(child: Text(text, style: TextStyle(fontSize: 18))),
      ),
    );
  }

  //선택됨 및 선택 안 됨 표시
  Row lable() {
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
                color: Colors.purple,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            SizedBox(width: 4),
            Text('선택됨'),
          ],
        ),
        SizedBox(width: 20),
        //선택 안 됨
        Row(
          children: [
            Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            SizedBox(width: 4),
            Text('선택 안 됨'),
          ],
        ),
      ],
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
                    : Colors.grey[300],
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}

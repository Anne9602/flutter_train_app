import 'package:flutter/material.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: Column(
          children: [
            SizedBox(height: 10),
            //출발역 -> 도착역 표시
            departureToArrival(departure: departure, arrival: arrival),
            SizedBox(height: 10),
            //선택됨 및 선택 안 됨 표시
            lable(),
            SizedBox(height: 10),
            //ABCD레이블
            Row(
              children: [
                lableforLow('A'),
                lableforLow('B'),
                lableforLow(' '),
                lableforLow('C'),
                lableforLow('D'),
              ],
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: ListView(
                  children: [
                    //좌석 선택
                    for (int i = 0; i < 20; i++) row(i + 1),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //ABCD레이블 표시
  Expanded lableforLow(String text) {
    return Expanded(
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

//출발역 -> 도착역 위젯
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
    return Row(
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
    );
  }
}

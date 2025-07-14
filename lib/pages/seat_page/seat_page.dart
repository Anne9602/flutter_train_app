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
            //좌석 선택
            col(),
          ],
        ),
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
            SizedBox(width: 20),
            Container(
              height: 36,
              width: 36,
              decoration: BoxDecoration(
                //클릭한 row,col의 도형 색칠하기
                color: Colors.purple,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Text('선택됨'),
          ],
        ),
        SizedBox(width: 30),
        //선택 안 됨
        Row(
          children: [
            Container(
              height: 36,
              width: 36,
              decoration: BoxDecoration(
                //클릭한 row,col의 도형 색칠하기
                color: Colors.grey[350],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Text('선택 안 됨'),
          ],
        ),
      ],
    );
  }

  //열 넘버 부여
  Column col() {
    return Column(
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
    );
  }

  //행 넘버 부여
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

  //좌석 넘버 부여
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

  //좌석 그리기
  Expanded seat(int row, String col) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1,
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedRow = row;
                selectedCol = col;
              });
            },
            child: Container(
              height: 36,
              width: 36,
              decoration: BoxDecoration(
                //클릭한 row,col의 도형 색칠하기
                color:
                    selectedRow == row && selectedCol == col
                        ? Colors.purple
                        : Colors.grey[350],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
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
        Expanded(
          child: Center(
            child: Text(
              departure,
              style: TextStyle(
                fontSize: 26,
                color: Colors.purple,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black, width: 3),
            ),
            child: Icon(Icons.arrow_forward),
          ),
        ),

        Expanded(
          child: Center(
            child: Text(
              arrival,
              style: TextStyle(
                fontSize: 26,
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

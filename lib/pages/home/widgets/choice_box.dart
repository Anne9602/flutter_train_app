import 'package:flutter/material.dart';

//출발역 및 도착역 선택을 위한 위젯

class ChoiceBox extends StatelessWidget {
  const ChoiceBox({
    this.departureStation,
    this.arrivalStation,
    required this.onDepartureSelected,
    required this.onArrivalSelected,
  });

  final String? departureStation;
  final String? arrivalStation;

  // 콜백 함수로 출발역과 도착역 선택 시 상태 업데이트를 위한 함수
  // 이 함수들은 HomePage에서 정의되어 전달됨
  final Function(String) onDepartureSelected;
  final Function(String) onArrivalSelected;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        Container(
          height: 200,
          child: Row(
            children: [
              //출발역
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '출발역',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      // 출발역 선택시 StationListPage로 이동
                      onTap: () async {
                        var result = await Navigator.pushNamed(
                          context,
                          '/stationList',
                          arguments: 'departure',
                        );
                        // 선택된 출발역을 받아와서 상태 업데이트
                        // 만약 result가 null이 아니면 선택된 역을 업데이트(콜백함수)
                        if (result != null) {
                          onDepartureSelected(result as String);
                        }
                      },
                      child: Text(
                        departureStation ?? '선택',
                        style: TextStyle(fontSize: 40),
                      ),
                    ),
                  ],
                ),
              ),

              //세로 구분선
              Container(width: 2, height: 50, color: Colors.grey[400]),

              //도착역
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '도착역',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      // 도착역 선택시 StationListPage로 이동
                      onTap: () async {
                        var result = await Navigator.pushNamed(
                          context,
                          '/stationList',
                          arguments: 'arrival',
                        );
                        // 선택된 도착역을 받아와서 상태 업데이트
                        // 만약 result가 null이 아니면 선택된 역을 업데이트
                        if (result != null) {
                          onArrivalSelected(result as String);
                        }
                      },
                      child: Text(
                        arrivalStation ?? '선택',
                        style: TextStyle(fontSize: 40),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

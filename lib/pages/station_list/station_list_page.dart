import 'package:flutter/material.dart';

//출발역과 도착역 선택 페이지

class StationListPage extends StatelessWidget {
  StationListPage({super.key});
  final List<String> stations = [
    '수서',
    '동탄',
    '평택지제',
    '천안아산',
    '오송',
    '대전',
    '김천구미',
    '동대구',
    '경주',
    '울산',
    '부산',
  ];

  @override
  Widget build(BuildContext context) {
    //맵형태의 인자 받기
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final String type = args['type'];
    final String? selectedStaion = args['selectedStation']; //상대역정보 추출

    final String title = type == 'departure' ? '출발역' : '도착역';

    //출발역이나 도착역에 이미 선택된 역은 제외하고 보여주기
    final filteredStations =
        (selectedStaion != null)
            ? stations.where((station) => station != selectedStaion).toList()
            : stations;

    return Scaffold(
      appBar: AppBar(title: Center(child: Text(title))),
      body: ListView.builder(
        itemCount: filteredStations.length,
        itemBuilder: (context, index) {
          return Container(
            height: 50,
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
            ),
            child: ListTile(
              title: Text(
                filteredStations[index],
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                //출발역,도착역 클릭시 로직 구현
                Navigator.pop(context, filteredStations[index]);
              },
            ),
          );
        },
      ),
    );
  }
}

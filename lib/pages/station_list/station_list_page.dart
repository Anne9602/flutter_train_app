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
    final String type = ModalRoute.of(context)?.settings.arguments as String;
    final String title = type == 'departure' ? '출발역' : '도착역';

    return Scaffold(
      appBar: AppBar(title: Center(child: Text(title))),
      body: ListView.builder(
        itemCount: stations.length,
        itemBuilder: (context, index) {
          return Container(
            height: 50,
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
            ),
            child: ListTile(
              title: Text(
                stations[index],
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                //출발역,도착역 클릭시 로직 구현
                Navigator.pop(context, stations[index]);
              },
            ),
          );
        },
      ),
    );
  }
}

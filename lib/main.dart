import 'package:flutter/material.dart';
import 'package:flutter_train_app/pages/home/home_page.dart';
import 'package:flutter_train_app/pages/seat_page/seat_page.dart';
import 'package:flutter_train_app/pages/station_list/station_list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
        ),
        dividerColor: Colors.grey[300],
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        dividerColor: Colors.grey[600],
      ),
      themeMode: ThemeMode.dark,

      routes: {
        '/': (context) => HomePage(),
        '/stationList': (context) => StationListPage(),
        '/seatpage': (context) => SeatPage(),
      },
    );
  }
}

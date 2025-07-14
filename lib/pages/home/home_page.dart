import 'package:flutter/material.dart';
import 'package:flutter_train_app/pages/home/widgets/choice_box.dart';
import 'package:flutter_train_app/pages/home/widgets/seat_choice_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //home page - choice box - seat choice button 용 변수
  String? departureStation;
  String? arrivalStation;

  void onDepartureSelected(String station) {
    setState(() {
      departureStation = station;
    });
  }

  void onArrivalSelected(String station) {
    setState(() {
      arrivalStation = station;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('기차 예매'))),
      backgroundColor: isDark ? Colors.grey[1000] : Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ChoiceBox(
              departureStation: departureStation,
              arrivalStation: arrivalStation,
              onDepartureSelected: onDepartureSelected,
              onArrivalSelected: onArrivalSelected,
            ),
            SizedBox(height: 20),
            SeatChoiceButton(departureStation, arrivalStation),
          ],
        ),
      ),
    );
  }
}

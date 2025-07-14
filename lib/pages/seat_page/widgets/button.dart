import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

SizedBox reservation_button(
  BuildContext context,
  int? selectedRow,
  String? selectedCol,
) {
  return SizedBox(
    width: double.infinity,
    height: 50,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.purple,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      onPressed: () {
        //선택된 좌석이 없으면 아무반응 x, 있으면 터치시 팝업 구현
        if (selectedCol == null || selectedRow == null) {
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

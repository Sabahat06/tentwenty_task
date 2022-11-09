import 'package:flutter/material.dart';

class SeatingViewModel extends ChangeNotifier {

   List<String> dates = ["1 March", "2 March", "3 March", "4 March", "5 March", "6 March", "7 March", "8 March", "9 March",];

   int isSelected = 0;

   selectDate(int index) {
     isSelected = index;
     notifyListeners();
   }

   int isSeatSelected = 0;

   selectSeating(int index) {
     isSeatSelected = index;
     notifyListeners();
   }

}
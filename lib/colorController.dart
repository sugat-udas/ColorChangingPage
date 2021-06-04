import 'package:flutter/material.dart';

class ColorController extends ChangeNotifier{
  bool chooseColorFlag=false;
  Color changedColor;
  Color primaryColor=Colors.green;

  changePrimaryColor(Color color){
    primaryColor=color;
    notifyListeners();
  }

  changeColorFlag(){
    chooseColorFlag=!chooseColorFlag;
    notifyListeners();
  }
}
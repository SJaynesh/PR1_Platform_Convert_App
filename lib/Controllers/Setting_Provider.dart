
import 'package:flutter/material.dart';
import 'package:platform_convert_app_code/Models/Setting_Model.dart';

class Setting_Provider extends ChangeNotifier{

  Setting_Model s1 = Setting_Model(isOn: false);

  changeIsOnValue() {
    s1.isOn = !s1.isOn;

    notifyListeners();
  }
}
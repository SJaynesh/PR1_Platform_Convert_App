
import 'package:flutter/material.dart';
import 'package:platform_convert_app_code/Models/Ui_Model.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Ui_Provider extends ChangeNotifier{

  Ui_Model u1;

  Ui_Provider({required this.u1});

  changeUiForMobile() async{
    u1.isUi = !u1.isUi;

    SharedPreferences Pref = await SharedPreferences.getInstance();

    Pref.setBool('isUi', u1.isUi);

    notifyListeners();
  }
}
import 'package:flutter/material.dart';
import 'package:platform_convert_app_code/Models/TextFiledValue_Model.dart';
import 'package:platform_convert_app_code/utills/All_Atributes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TextFieldValue_Provider extends ChangeNotifier {

  TextFieldValue_Model T1;

  TextFieldValue_Provider({required this.T1});

  ChangedValue() async{

    SharedPreferences Pref = await SharedPreferences.getInstance();

    Pref.setString('NameSetting', T1.NameController.text);
    Pref.setString('BioSetting', T1.BioDataController.text);

    notifyListeners();
  }

  ClearController() async{
    T1.NameController.clear();
    T1.BioDataController.clear();

    SharedPreferences Pref = await SharedPreferences.getInstance();

    Pref.setString('NameSetting', T1.NameController.text);
    Pref.setString('BioSetting', T1.BioDataController.text);

    notifyListeners();
  }
}
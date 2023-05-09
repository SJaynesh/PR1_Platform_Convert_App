import 'dart:io';

import 'package:flutter/material.dart';
import 'package:platform_convert_app_code/Models/AddPageValue_Model.dart';
import 'package:platform_convert_app_code/utills/All_Atributes.dart';

import 'package:shared_preferences/shared_preferences.dart';


class AddPageValue_Provider extends ChangeNotifier {
  AddPageValue_Model M1;

  AddPageValue_Provider({required this.M1});

  SaveValueAddPage() async {
    FullName.add(fullName!);
    PhoneNumber.add(phoneNumber!);
    Chats.add(chat!);
    Dates.add(PickedDate!.day.toString());
    Months.add(PickedDate!.month.toString());
    Years.add(PickedDate!.year.toString());
    Hours.add(Time.hour.toString());
    Minits.add(Time.minute.toString());
    Images.add(allImages);

    SharedPreferences Pref = await SharedPreferences.getInstance();
    await Pref.setStringList('FullName', FullName);
    await Pref.setStringList('PhoneNumber', PhoneNumber);
    await Pref.setStringList('Chats', Chats);
    await Pref.setStringList('Dates', Dates);
    await Pref.setStringList('Months', Months);
    await Pref.setStringList('Years', Years);
    await Pref.setStringList('Hours', Hours);
    await Pref.setStringList('Minits', Minits);
    await Pref.setStringList('Images', Images);

    notifyListeners();
  }
  
  ClearValue(int i) async{

    FullName.remove(FullName[i]);
    PhoneNumber.remove(PhoneNumber[i]);
    Chats.remove(Chats[i]);
    Dates.remove(Dates[i]);
    Months.remove(Months[i]);
    Years.remove(Years[i]);
    Hours.remove(Hours[i]);
    Minits.remove(Minits[i]);
    Images.remove(Images[i]);

    SharedPreferences Pref = await SharedPreferences.getInstance();
    await Pref.setStringList('FullName', FullName);
    await Pref.setStringList('PhoneNumber', PhoneNumber);
    await Pref.setStringList('Chats', Chats);
    await Pref.setStringList('Dates', Dates);
    await Pref.setStringList('Months', Months);
    await Pref.setStringList('Years', Years);
    await Pref.setStringList('Hours', Hours);
    await Pref.setStringList('Minits', Minits);
    await Pref.setStringList('Images', Images);

    notifyListeners();
  }

  EditValue(int i) async{

    FullName[i] = fullNameEdit!;
    PhoneNumber[i] = phoneNumberEdit!;
    Chats[i] = chatEdit!;
    Dates[i] = PickedDateEdit!.day.toString();
    Months[i] = PickedDateEdit!.month.toString();
    Years[i] = PickedDateEdit!.year.toString();
    Hours[i] = TimeEdit.hour.toString();
    Minits[i] = TimeEdit.minute.toString();
    Images[i] = allImages;

    SharedPreferences Pref = await SharedPreferences.getInstance();
    await Pref.setStringList('FullName', FullName);
    await Pref.setStringList('PhoneNumber', PhoneNumber);
    await Pref.setStringList('Chats', Chats);
    await Pref.setStringList('Dates', Dates);
    await Pref.setStringList('Months', Months);
    await Pref.setStringList('Years', Years);
    await Pref.setStringList('Hours', Hours);
    await Pref.setStringList('Minits', Minits);
    await Pref.setStringList('Images', Images);

    notifyListeners();
  }
  
}

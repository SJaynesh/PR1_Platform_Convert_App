import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_convert_app_code/Controllers/AddImage_Provider.dart';
import 'package:platform_convert_app_code/Controllers/AddPageValue_Provider.dart';
import 'package:platform_convert_app_code/Controllers/ImagePicker_Provider.dart';
import 'package:platform_convert_app_code/Controllers/Setting_Provider.dart';
import 'package:platform_convert_app_code/Controllers/TextFieldValue_Provider.dart';
import 'package:platform_convert_app_code/Controllers/Theme_Provider.dart';
import 'package:platform_convert_app_code/Controllers/Ui_Provider.dart';
import 'package:platform_convert_app_code/Models/AddPageValue_Model.dart';
import 'package:platform_convert_app_code/Models/ImagePicker_Model.dart';
import 'package:platform_convert_app_code/Models/TextFiledValue_Model.dart';
import 'package:platform_convert_app_code/Models/Theme_Model.dart';
import 'package:platform_convert_app_code/Models/Ui_Model.dart';
import 'package:platform_convert_app_code/View.Screens/Material/HomePage.dart';
import 'package:platform_convert_app_code/utills/All_Atributes.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Globals/Globals.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences Pref = await SharedPreferences.getInstance();

  bool isDark = Pref.getBool('isDark') ?? false;

  bool isUi = Pref.getBool('isUi') ?? false;

  String NameSetting = Pref.getString('NameSetting') ?? "";
  String BioSetting = Pref.getString('BioSetting') ?? "";

  String image = Pref.getString('Image') ?? '';

  FullName = Pref.getStringList('FullName') ?? [];
  PhoneNumber = Pref.getStringList('PhoneNumber') ?? [];
  Chats = Pref.getStringList('Chats') ?? [];
  Dates = Pref.getStringList('Dates') ?? [];
  Months = Pref.getStringList('Months') ?? [];
  Years = Pref.getStringList('Years') ?? [];
  Hours = Pref.getStringList('Hours') ?? [];
  Minits = Pref.getStringList('Minits') ?? [];
  Images = Pref.getStringList('Images') ?? [];

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) =>
                Theme_Provider(m1: Theme_Model(isDark: isDark))),
        ChangeNotifierProvider(
            create: (context) => Ui_Provider(u1: Ui_Model(isUi: isUi))),
        ChangeNotifierProvider(create: (context) => Setting_Provider()),
        // ChangeNotifierProvider(create: (context) => ImagePicker_Provider()),
        ChangeNotifierProvider(
            create: (context) => ImagePicker_Provider(
                I1: ImagePicker_Model(image: File(image)))),
        ChangeNotifierProvider(create: (context) => AddImage_Provider()),
        ChangeNotifierProvider(
            create: (context) => TextFieldValue_Provider(
                T1: TextFieldValue_Model(
                    NameController: TextEditingController(text: NameSetting),
                    BioDataController:
                        TextEditingController(text: BioSetting)))),
        ChangeNotifierProvider(
            create: (context) => AddPageValue_Provider(
                M1: AddPageValue_Model(
                    FullName: FullName,
                    PhoneNumber: PhoneNumber,
                    Chats: Chats,
                    Dates: Dates,
                    Months: Months,
                    Years: Years,
                    Hours: Hours,
                    Minits: Minits,
                    Images: Images))),
      ],
      builder: (context, _) => (Provider.of<Ui_Provider>(context).u1.isUi)
          ? CupertinoApp(
              debugShowCheckedModeBanner: false,
              theme: MaterialBasedCupertinoThemeData(
                materialTheme: (Provider.of<Theme_Provider>(context).m1.isDark)
                    ? Globals.dark_Theme
                    : Globals.ligth_Theme,
              ),
              routes: {
                "/": (context) => HomePage(),
              },
            )
          : MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: Globals.ligth_Theme,
              darkTheme: Globals.dark_Theme,
              themeMode: (Provider.of<Theme_Provider>(context).m1.isDark)
                  ? ThemeMode.dark
                  : ThemeMode.light,
              routes: {
                "/": (context) => HomePage(),
              },
            ),
    ),
  );
}

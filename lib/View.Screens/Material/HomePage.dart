import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:platform_convert_app_code/Components/AddContact.dart';
import 'package:platform_convert_app_code/Components/CallComponet.dart';
import 'package:platform_convert_app_code/Components/ChatsComponet.dart';
import 'package:platform_convert_app_code/Components/SettingComponet.dart';
import 'package:platform_convert_app_code/Controllers/Ui_Provider.dart';
import 'package:provider/provider.dart';

import '../../Controllers/Theme_Provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List page = [
    AddContacts(),
    ChatsComponet(),
    CallComponet(),
    SettingComponet(),
  ];

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;

    return (Provider.of<Ui_Provider>(context).u1.isUi)
        ? CupertinoTabScaffold(
      resizeToAvoidBottomInset: false,
            tabBar: CupertinoTabBar(
              items: [
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.person_badge_minus_fill),
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.chat_bubble_2),
                  label: "CHATS",
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.phone),
                  label: "Calls",
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.settings),
                  label: "SETTINGS",
                ),
              ],
            ),
            tabBuilder: (context, i) => CupertinoTabView(
              builder: (context) => CupertinoPageScaffold(
                navigationBar: CupertinoNavigationBar(
                  backgroundColor:
                      (Provider.of<Theme_Provider>(context).m1.isDark)
                          ? CupertinoColors.black
                          : CupertinoColors.white,
                  middle: Text(
                    "Platform Convert",
                    style: TextStyle(
                      fontSize: h * 0.025,
                      color: (Provider.of<Theme_Provider>(context).m1.isDark)
                          ? CupertinoColors.white
                          : CupertinoColors.black,
                    ),
                  ),
                  trailing: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CupertinoSwitch(
                          value: Provider.of<Ui_Provider>(context).u1.isUi,
                          onChanged: (val) {
                            Provider.of<Ui_Provider>(context, listen: false)
                                .changeUiForMobile();
                          })
                    ],
                  ),
                ),
                child: page[i],
              ),
            ),
          )
        : DefaultTabController(
            length: 4,
            child: Scaffold(
              appBar: AppBar(
                bottom: TabBar(
                    indicatorColor: Colors.purpleAccent,
                    labelColor: Colors.purpleAccent,
                    tabs: [
                      Icon(
                        Icons.person_3_outlined,
                        size: h * 0.03,
                      ),
                      Text(
                        "CHATS",
                        style: TextStyle(
                          fontSize: h * 0.019,
                        ),
                      ),
                      Text(
                        "CALLS",
                        style: TextStyle(
                          fontSize: h * 0.019,
                        ),
                      ),
                      Text(
                        "SETTING",
                        style: TextStyle(
                          fontSize: h * 0.019,
                        ),
                      ),
                    ]),
                title: Text(
                  "Paltform Converter",
                  style: TextStyle(
                    fontSize: h * 0.03,
                  ),
                ),
                elevation: 0,
                actions: [
                  Switch(
                    inactiveTrackColor: Colors.grey.shade300,
                    thumbColor: MaterialStateProperty.all(Colors.grey.shade700),
                    value: Provider.of<Ui_Provider>(context).u1.isUi,
                    onChanged: (val) {
                      Provider.of<Ui_Provider>(context, listen: false)
                          .changeUiForMobile();
                    },
                  ),
                ],
              ),
              body: TabBarView(
                children: [
                  AddContacts(),
                  ChatsComponet(),
                  CallComponet(),
                  SettingComponet(),
                ],
              ),
            ),
          );
  }
}

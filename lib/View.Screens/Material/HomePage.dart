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
                    onTap: (val) {
                      print(val);
                    },
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
                  // IconButton(
                  //   onPressed: () {},
                  //   icon: Icon(
                  //     Icons.menu,
                  //     size: h * 0.02,
                  //   ),
                  // ),

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
              // bottomNavigationBar: BottomNavigationBar(
              //   currentIndex: pageViewIndex,
              //   onTap: (val) {
              //     setState(() {
              //       pageViewIndex = val;
              //       pageController.animateToPage(
              //         pageViewIndex,
              //         duration: Duration(milliseconds: 800),
              //         curve: Curves.bounceIn,
              //       );
              //     });
              //   },
              //   items: [
              //     BottomNavigationBarItem(
              //       icon: Icon(Icons.person_3),
              //       label: "Contact",
              //       backgroundColor: Colors.blue,
              //     ),
              //     BottomNavigationBarItem(
              //       icon: Icon(Icons.wechat_sharp),
              //       label: "CHATS",
              //       backgroundColor: Colors.blue,
              //     ),
              //     BottomNavigationBarItem(
              //       icon: Icon(Icons.phone),
              //       label: "CALLS",
              //       backgroundColor: Colors.blue,
              //     ),
              //     BottomNavigationBarItem(
              //       icon: Icon(Icons.settings),
              //       label: "SETTINGS",
              //       backgroundColor: Colors.blue,
              //     ),
              //   ],
              // ),
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
// Container
// (
// child: Column(
// children: [
// Row(
// children: [
// Expanded(
// child: Container(
// height: h * 0.05,
// width: w * 0.3,
// alignment: Alignment.center,
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// mainAxisSize: MainAxisSize.min,
// children: [
// GestureDetector(
// onTap: () {
// Provider.of<HomePage_Provider>(context,
// listen: false)
//     .m1
//     .pageViewIndex = 0;
// Provider.of<HomePage_Provider>(context,
// listen: false)
//     .changeValue();
// print(Provider.of<HomePage_Provider>(context,
// listen: false)
//     .m1
//     .pageViewIndex);
// },
// child: Icon(
// Icons.person_3_outlined,
// size: h * 0.03,
// color: (Provider.of<HomePage_Provider>(
// context,
// listen: true)
//     .m1
//     .pageViewIndex ==
// 0)
// ? Colors.purple
//     : Colors.black45,
// ),
// ),
// (Provider.of<HomePage_Provider>(context,
// listen: false)
//     .m1
//     .pageViewIndex ==
// 0)
// ? Divider(
// color: Colors.purple,
// thickness: 3,
// indent: 40,
// endIndent: 40,
// )
//     : Divider(
// color: Colors.white,
// ),
// ],
// ),
// ),
// ),
// Expanded(
// child: Container(
// height: h * 0.05,
// width: w * 0.3,
// alignment: Alignment.center,
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// mainAxisSize: MainAxisSize.min,
// children: [
// GestureDetector(
// onTap: () {
// Provider.of<HomePage_Provider>(context,
// listen: false)
//     .m1
//     .pageViewIndex = 1;
// Provider.of<HomePage_Provider>(context,
// listen: false)
//     .changeValue();
// print(Provider.of<HomePage_Provider>(context,
// listen: false)
//     .m1
//     .pageViewIndex);
// },
// child: Text(
// "CHATS",
// style: TextStyle(
// fontSize: h * 0.019,
// color: (Provider.of<HomePage_Provider>(
// context,
// listen: true)
//     .m1
//     .pageViewIndex ==
// 1)
// ? Colors.purple
//     : Colors.black54,
// ),
// ),
// ),
// (Provider.of<HomePage_Provider>(context,
// listen: true)
//     .m1
//     .pageViewIndex ==
// 1)
// ? Divider(
// color: Colors.purple,
// thickness: 3,
// indent: 30,
// endIndent: 30,
// )
//     : Divider(
// color: Colors.white,
// ),
// ],
// ),
// ),
// ),
// Expanded(
// child: Container(
// height: h * 0.05,
// width: w * 0.3,
// alignment: Alignment.center,
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// mainAxisSize: MainAxisSize.min,
// children: [
// GestureDetector(
// onTap: () {
// Provider.of<HomePage_Provider>(context,
// listen: false)
//     .m1
//     .pageViewIndex = 2;
// Provider.of<HomePage_Provider>(context,
// listen: false)
//     .changeValue();
// print(Provider.of<HomePage_Provider>(context,
// listen: false)
//     .m1
//     .pageViewIndex);
// },
// child: Text(
// "CALLS",
// style: TextStyle(
// fontSize: h * 0.019,
// color: (Provider.of<HomePage_Provider>(
// context,
// listen: false)
//     .m1
//     .pageViewIndex ==
// 2)
// ? Colors.purple
//     : Colors.black54,
// ),
// ),
// ),
// (Provider.of<HomePage_Provider>(context,
// listen: false)
//     .m1
//     .pageViewIndex ==
// 2)
// ? Divider(
// color: Colors.purple,
// thickness: 3,
// indent: 30,
// endIndent: 30,
// )
//     : Divider(
// color: Colors.white,
// ),
// ],
// ),
// ),
// ),
// Expanded(
// child: Container(
// height: h * 0.05,
// width: w * 0.3,
// alignment: Alignment.center,
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// mainAxisSize: MainAxisSize.min,
// children: [
// GestureDetector(
// onTap: () {
// Provider.of<HomePage_Provider>(context,
// listen: false)
//     .m1
//     .pageViewIndex = 3;
// Provider.of<HomePage_Provider>(context,
// listen: false)
//     .changeValue();
// print(Provider.of<HomePage_Provider>(context,
// listen: false)
//     .m1
//     .pageViewIndex);
// },
// child: Text(
// "SETTINGS",
// style: TextStyle(
// fontSize: h * 0.019,
// color: (Provider.of<HomePage_Provider>(
// context,
// listen: false)
//     .m1
//     .pageViewIndex ==
// 3)
// ? Colors.purple
//     : Colors.black54,
// ),
// ),
// ),
// (Provider.of<HomePage_Provider>(context,
// listen: false)
//     .m1
//     .pageViewIndex ==
// 3)
// ? Divider(
// color: Colors.purple,
// thickness: 3,
// indent: 20,
// endIndent: 20,
// )
//     : Divider(
// color: Colors.white,
// ),
// ],
// ),
// ),
// ),
// ],
// ),
// Container(
// height: h * 0.82,
// width: w,
// child: PageView(
// controller: pageController,
// onPageChanged: (val) {
// Provider.of<HomePage_Provider>(context, listen: false)
//     .m1
//     .pageViewIndex = val;
// // Provider.of<HomePage_Provider>(context,listen: false).changeValue();
//
// print( Provider.of<HomePage_Provider>(context,listen: false).m1.pageViewIndex);
// },
// scrollDirection: Axis.horizontal,
// pageSnapping: true,
// children: [
// AddContacts(),
// ChatsComponet(),
// CallComponet(),
// SettingComponet(),
// ],
// ),
// ),
// ],
// ),
// )
// ,

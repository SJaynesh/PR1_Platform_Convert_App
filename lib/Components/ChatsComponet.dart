import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_convert_app_code/Controllers/AddPageValue_Provider.dart';
import 'package:provider/provider.dart';

import '../Controllers/Ui_Provider.dart';

class ChatsComponet extends StatefulWidget {
  const ChatsComponet({Key? key}) : super(key: key);

  @override
  State<ChatsComponet> createState() => _ChatsComponetState();
}

class _ChatsComponetState extends State<ChatsComponet> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;

    return (Provider.of<Ui_Provider>(context).u1.isUi)
        ? (Provider.of<AddPageValue_Provider>(context, listen: false)
                .M1
                .FullName
                .isEmpty)
            ? Container(
                alignment: Alignment.center,
                child: Text(
                  "CHATS PAGE ",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              )
            : ListView.builder(
      itemCount: Provider.of<AddPageValue_Provider>(context,listen: false).M1.FullName.length,
      itemBuilder: (context,i)=> Padding(
        padding: const EdgeInsets.all(10),
        child: CupertinoListTile(
          leading: Transform.scale(
            scale: 1.6,
            child: CircleAvatar(
              foregroundImage: (Provider.of<AddPageValue_Provider>(context,listen: false).M1.Images != null)
                  ? FileImage(File(Provider.of<AddPageValue_Provider>(context,listen: false).M1.Images[i] ),)
                  : null,
            ),
          ),
          title: Text(Provider.of<AddPageValue_Provider>(context,listen: false).M1.FullName[i]),
          subtitle: Text(Provider.of<AddPageValue_Provider>(context,listen: false).M1.Chats[i]),
          trailing: Text("${Provider.of<AddPageValue_Provider>(context,listen: false).M1.Dates[i]} / ${Provider.of<AddPageValue_Provider>(context,listen: false).M1.Months[i]} / ${Provider.of<AddPageValue_Provider>(context,listen: false).M1.Years[i]} , ${Provider.of<AddPageValue_Provider>(context,listen: false).M1.Hours[i]} : ${Provider.of<AddPageValue_Provider>(context,listen: false).M1.Minits[i]}"),
        ),
      ),
    )
        : (Provider.of<AddPageValue_Provider>(context, listen: false)
                .M1
                .FullName
                .isEmpty)
            ? Container(
                alignment: Alignment.center,
                child: Text(
                  "CHATS PAGE ",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              )
            : ListView.builder(
                itemCount: Provider.of<AddPageValue_Provider>(context,listen: false).M1.FullName.length,
                itemBuilder: (context,i)=> Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListTile(
                    onTap: () {

                    },
                    leading: Transform.scale(
                      scale: 1.6,
                        child: CircleAvatar(
                          foregroundImage: (Provider.of<AddPageValue_Provider>(context,listen: false).M1.Images != null)
                              ? FileImage(File(Provider.of<AddPageValue_Provider>(context,listen: false).M1.Images[i] ),)
                              : null,
                        ),
                    ),
                    title: Text(Provider.of<AddPageValue_Provider>(context,listen: false).M1.FullName[i]),
                    subtitle: Text(Provider.of<AddPageValue_Provider>(context,listen: false).M1.Chats[i]),
                    trailing: Text("${Provider.of<AddPageValue_Provider>(context,listen: false).M1.Dates[i]} / ${Provider.of<AddPageValue_Provider>(context,listen: false).M1.Months[i]} / ${Provider.of<AddPageValue_Provider>(context,listen: false).M1.Years[i]} , ${Provider.of<AddPageValue_Provider>(context,listen: false).M1.Hours[i]} : ${Provider.of<AddPageValue_Provider>(context,listen: false).M1.Minits[i]}"),
                  ),
                ),
    );
  }
}

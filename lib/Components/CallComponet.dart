import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Controllers/AddPageValue_Provider.dart';
import '../Controllers/Ui_Provider.dart';

import 'package:url_launcher/url_launcher.dart';

class CallComponet extends StatefulWidget {
  const CallComponet({Key? key}) : super(key: key);

  @override
  State<CallComponet> createState() => _CallComponetState();
}

class _CallComponetState extends State<CallComponet> {
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
          trailing: GestureDetector(
            onTap: () async{
              Uri uri = Uri.parse(
                  "tel:+91${Provider.of<AddPageValue_Provider>(context,listen: false).M1.PhoneNumber[i]}");
              try {
                await launchUrl(uri);
              } catch (e) {
                print("Exception : $e");
              }
            },
            child:
            Icon(CupertinoIcons.phone_fill,
              color: CupertinoColors.activeGreen,
            ),
          ),
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
          trailing: IconButton(
            onPressed: () async {
              Uri uri = Uri.parse(
                  "tel:+91${Provider.of<AddPageValue_Provider>(context,listen: false).M1.PhoneNumber[i]}");
              try {
                await launchUrl(uri);
              } catch (e) {
                print("Exception : $e");
              }
            },
            icon: Icon(
              Icons.call,
              color: Colors.green,
              size: 30,
            ),
          ),
          ),
      ),
    );
  }
}

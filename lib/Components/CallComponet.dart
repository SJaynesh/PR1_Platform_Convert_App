import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../Controllers/AddImage_Provider.dart';
import '../Controllers/AddPageValue_Provider.dart';
import '../Controllers/ImagePicker_Provider.dart';
import '../Controllers/Theme_Provider.dart';
import '../Controllers/Ui_Provider.dart';

import 'package:url_launcher/url_launcher.dart';

import '../utills/All_Atributes.dart';

class CallComponet extends StatefulWidget {
  const CallComponet({Key? key}) : super(key: key);

  @override
  State<CallComponet> createState() => _CallComponetState();
}

class _CallComponetState extends State<CallComponet> {
  GlobalKey<FormState> FormKey = GlobalKey<FormState>();

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
                itemCount: Provider.of<AddPageValue_Provider>(context)
                    .M1
                    .FullName
                    .length,
                itemBuilder: (context, i) => Padding(
                  padding: const EdgeInsets.all(10),
                  child: CupertinoListTile(
                    onTap: () {
                      showCupertinoModalPopup(
                        context: context,
                        builder: (context) => CupertinoActionSheet(
                          title: CircleAvatar(
                            radius: h * 0.07,
                            foregroundImage:
                                (Provider.of<AddPageValue_Provider>(context,
                                                listen: false)
                                            .M1
                                            .Images !=
                                        null)
                                    ? FileImage(
                                        File(Provider.of<AddPageValue_Provider>(
                                                context,
                                                listen: false)
                                            .M1
                                            .Images[i]),
                                      )
                                    : null,
                          ),
                          actions: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: h * 0.02,
                                ),
                                Text(
                                  Provider.of<AddPageValue_Provider>(context,
                                          listen: false)
                                      .M1
                                      .FullName[i],
                                  style: TextStyle(
                                    fontSize: h * 0.025,
                                    fontWeight: FontWeight.bold,
                                    color: (Provider.of<Theme_Provider>(context)
                                            .m1
                                            .isDark)
                                        ? CupertinoColors.white
                                        : CupertinoColors.black,
                                  ),
                                ),
                                Text(
                                  Provider.of<AddPageValue_Provider>(context,
                                          listen: false)
                                      .M1
                                      .Chats[i],
                                  style: TextStyle(
                                    fontSize: h * 0.015,
                                    color: (Provider.of<Theme_Provider>(context)
                                            .m1
                                            .isDark)
                                        ? CupertinoColors.white
                                        : CupertinoColors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: h * 0.025,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CupertinoActionSheetAction(
                                      onPressed: () {
                                        showCupertinoDialog(
                                          context: context,
                                          builder: (context) => StatefulBuilder(
                                            builder: (context, setState) =>
                                                CupertinoAlertDialog(
                                              actions: [
                                                Form(
                                                  key: FormKey,
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Center(
                                                          child: CircleAvatar(
                                                            radius: h * 0.08,
                                                            foregroundImage: (Provider.of<AddImage_Provider>(
                                                                            context,
                                                                            listen:
                                                                                false)
                                                                        .a1
                                                                        .image !=
                                                                    null)
                                                                ? FileImage(Provider.of<
                                                                            AddImage_Provider>(
                                                                        context,
                                                                        listen:
                                                                            true)
                                                                    .a1
                                                                    .image as File)
                                                                : null,
                                                            backgroundColor:
                                                                Color(
                                                                    0xffE3DFFD),
                                                            child:
                                                                CupertinoButton(
                                                              child: Icon(
                                                                  CupertinoIcons
                                                                      .camera,
                                                                  size:
                                                                      h * 0.05),
                                                              onPressed: () {
                                                                showCupertinoDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (context) =>
                                                                          CupertinoAlertDialog(
                                                                    title:
                                                                        Center(
                                                                      child:
                                                                          Text(
                                                                        "SELECT",
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Color(0xff5F264A),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    actions: [
                                                                      CupertinoDialogAction(
                                                                        child:
                                                                            Icon(
                                                                          CupertinoIcons
                                                                              .camera_fill,
                                                                          color:
                                                                              Color(0xff5F264A),
                                                                        ),
                                                                        onPressed:
                                                                            () {
                                                                          Provider.of<AddImage_Provider>(context, listen: false)
                                                                              .putImageForCamera();
                                                                          Navigator.of(context)
                                                                              .pop();
                                                                        },
                                                                      ),
                                                                      CupertinoDialogAction(
                                                                        child:
                                                                            Icon(
                                                                          CupertinoIcons
                                                                              .photo,
                                                                          color:
                                                                              Color(0xff5F264A),
                                                                        ),
                                                                        onPressed:
                                                                            () {
                                                                          Provider.of<AddImage_Provider>(context, listen: false)
                                                                              .putImageForGallery();
                                                                          Provider.of<ImagePicker_Provider>(context, listen: false)
                                                                              .putImageForGallery();
                                                                          Navigator.of(context)
                                                                              .pop();
                                                                        },
                                                                      ),
                                                                    ],
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: h * 0.02,
                                                        ),
                                                        CupertinoButton(
                                                          color:
                                                              Color(0xfff5f5fd),
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 15,
                                                                  right: 15),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                          child: Text(
                                                            "Add picture",
                                                            style: TextStyle(
                                                              fontSize:
                                                                  h * 0.018,
                                                              color: Color(
                                                                  0xff376ab9),
                                                            ),
                                                          ),
                                                          onPressed: () {
                                                            showCupertinoDialog(
                                                              context: context,
                                                              builder: (context) =>
                                                                  CupertinoAlertDialog(
                                                                title: Center(
                                                                  child: Text(
                                                                    "SELECT",
                                                                    style:
                                                                        TextStyle(
                                                                      color: Color(
                                                                          0xff5F264A),
                                                                    ),
                                                                  ),
                                                                ),
                                                                actions: [
                                                                  CupertinoDialogAction(
                                                                    child: Icon(
                                                                      CupertinoIcons
                                                                          .camera_fill,
                                                                      color: Color(
                                                                          0xff5F264A),
                                                                    ),
                                                                    onPressed:
                                                                        () {
                                                                      Provider.of<AddImage_Provider>(
                                                                              context,
                                                                              listen: false)
                                                                          .putImageForCamera();
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop();
                                                                    },
                                                                  ),
                                                                  CupertinoDialogAction(
                                                                    child: Icon(
                                                                      CupertinoIcons
                                                                          .photo,
                                                                      color: Color(
                                                                          0xff5F264A),
                                                                    ),
                                                                    onPressed:
                                                                        () {
                                                                      Provider.of<AddImage_Provider>(
                                                                              context,
                                                                              listen: false)
                                                                          .putImageForGallery();
                                                                      Provider.of<ImagePicker_Provider>(
                                                                              context,
                                                                              listen: false)
                                                                          .putImageForGallery();
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop();
                                                                    },
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                        SizedBox(
                                                          height: h * 0.02,
                                                        ),
                                                        CupertinoTextFormFieldRow(
                                                          textInputAction:
                                                              TextInputAction
                                                                  .next,
                                                          prefix: Icon(
                                                            CupertinoIcons
                                                                .person_alt,
                                                            color:
                                                                CupertinoColors
                                                                    .systemTeal,
                                                          ),
                                                          controller:
                                                              FullNameController,
                                                          placeholderStyle:
                                                              TextStyle(
                                                            color: CupertinoColors
                                                                .placeholderText,
                                                          ),
                                                          style: TextStyle(
                                                              color: CupertinoColors
                                                                  .placeholderText),
                                                          onSaved: (val) {
                                                            fullNameEdit = val;
                                                            print(val);
                                                          },
                                                          validator: (val) {
                                                            if (val!.isEmpty) {
                                                              return "Enter Your Full Name";
                                                            } else {
                                                              return null;
                                                            }
                                                          },
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 20,
                                                                  right: 20),
                                                          placeholder: "Name",
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            border: Border.all(
                                                              style: BorderStyle
                                                                  .solid,
                                                              color: CupertinoColors
                                                                  .inactiveGray,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: h * 0.02,
                                                        ),
                                                        CupertinoTextFormFieldRow(
                                                          maxLength: 10,
                                                          prefix: Icon(
                                                            CupertinoIcons
                                                                .phone,
                                                            color:
                                                                CupertinoColors
                                                                    .systemTeal,
                                                          ),
                                                          textInputAction:
                                                              TextInputAction
                                                                  .next,
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          inputFormatters: [
                                                            FilteringTextInputFormatter
                                                                .digitsOnly,
                                                          ],
                                                          controller:
                                                              PhoneNumberController,
                                                          placeholderStyle:
                                                              TextStyle(
                                                            color: CupertinoColors
                                                                .placeholderText,
                                                          ),
                                                          style: TextStyle(
                                                              color: CupertinoColors
                                                                  .placeholderText),
                                                          onSaved: (val) {
                                                            phoneNumberEdit =
                                                                val;
                                                            print(val);
                                                          },
                                                          validator: (val) {
                                                            if (val!.isEmpty) {
                                                              return "Enter Your Phone Number";
                                                            } else {
                                                              return null;
                                                            }
                                                          },
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 20,
                                                                  right: 20),
                                                          placeholder:
                                                              "Phone Number",
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            border: Border.all(
                                                              style: BorderStyle
                                                                  .solid,
                                                              color: CupertinoColors
                                                                  .inactiveGray,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: h * 0.02,
                                                        ),
                                                        CupertinoTextFormFieldRow(
                                                          prefix: Icon(
                                                            CupertinoIcons
                                                                .chat_bubble,
                                                            color:
                                                                CupertinoColors
                                                                    .systemTeal,
                                                          ),
                                                          textInputAction:
                                                              TextInputAction
                                                                  .done,
                                                          controller:
                                                              ChatController,
                                                          placeholderStyle:
                                                              TextStyle(
                                                            color: CupertinoColors
                                                                .placeholderText,
                                                          ),
                                                          style: TextStyle(
                                                              color: CupertinoColors
                                                                  .placeholderText),
                                                          onSaved: (val) {
                                                            chatEdit = val;
                                                            print(val);
                                                          },
                                                          validator: (val) {
                                                            if (val!.isEmpty) {
                                                              return "Enter Your Chat Conversation";
                                                            } else {
                                                              return null;
                                                            }
                                                          },
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 20,
                                                                  right: 20),
                                                          placeholder:
                                                              "Chat Conversation",
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            border: Border.all(
                                                              style: BorderStyle
                                                                  .solid,
                                                              color: CupertinoColors
                                                                  .inactiveGray,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: h * 0.02,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 20),
                                                          child: Row(
                                                            children: [
                                                              GestureDetector(
                                                                onTap: () {
                                                                  showCupertinoModalPopup(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) =>
                                                                            Container(
                                                                      height: h *
                                                                          0.35,
                                                                      child:
                                                                          CupertinoDatePicker(
                                                                        onDateTimeChanged:
                                                                            (val) {
                                                                          setState(
                                                                              () {
                                                                            PickedDateEdit =
                                                                                val;
                                                                          });
                                                                        },
                                                                        initialDateTime:
                                                                            Date,
                                                                        minimumYear:
                                                                            2000,
                                                                        maximumYear:
                                                                            2024,
                                                                        use24hFormat:
                                                                            false,
                                                                        mode: CupertinoDatePickerMode
                                                                            .date,
                                                                        backgroundColor:
                                                                            CupertinoColors.separator,
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                                child: Icon(
                                                                  CupertinoIcons
                                                                      .calendar_today,
                                                                  color: CupertinoColors
                                                                      .systemTeal,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: w * 0.02,
                                                              ),
                                                              (PickedDateEdit !=
                                                                      null)
                                                                  ? Text(
                                                                      "${PickedDateEdit?.day} / ${PickedDateEdit?.month} / ${PickedDateEdit?.year}",
                                                                      style: TextStyle(
                                                                          color: (Provider.of<Theme_Provider>(context).m1.isDark)
                                                                              ? CupertinoColors.white
                                                                              : CupertinoColors.black),
                                                                    )
                                                                  : Text(
                                                                      "Pick Date",
                                                                      style: TextStyle(
                                                                          color: (Provider.of<Theme_Provider>(context).m1.isDark)
                                                                              ? CupertinoColors.white
                                                                              : CupertinoColors.black),
                                                                    ),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: h * 0.02,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 20),
                                                          child: Row(
                                                            children: [
                                                              GestureDetector(
                                                                onTap: () {
                                                                  showCupertinoModalPopup(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) =>
                                                                            Container(
                                                                      height: h *
                                                                          0.35,
                                                                      child:
                                                                          CupertinoDatePicker(
                                                                        onDateTimeChanged:
                                                                            (val) {
                                                                          setState(
                                                                              () {
                                                                            InitialTime =
                                                                                val;

                                                                            if (InitialTime.hour >=
                                                                                12) {
                                                                              PeriodName = "PM";
                                                                            } else {
                                                                              PeriodName = "AM";
                                                                            }
                                                                          });
                                                                        },
                                                                        initialDateTime:
                                                                            InitialTime,
                                                                        mode: CupertinoDatePickerMode
                                                                            .time,
                                                                        backgroundColor:
                                                                            CupertinoColors.separator,
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                                child: Icon(
                                                                  CupertinoIcons
                                                                      .time,
                                                                  color: CupertinoColors
                                                                      .systemTeal,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: w * 0.02,
                                                              ),
                                                              (PeriodName ==
                                                                      null)
                                                                  ? Text(
                                                                      "Pick Time",
                                                                      style: TextStyle(
                                                                          color: (Provider.of<Theme_Provider>(context).m1.isDark)
                                                                              ? CupertinoColors.white
                                                                              : CupertinoColors.black),
                                                                    )
                                                                  : (PeriodName ==
                                                                          "AM")
                                                                      ? Text(
                                                                          "${InitialTime.hour} : ${InitialTime.minute} $PeriodName",
                                                                          style:
                                                                              TextStyle(color: (Provider.of<Theme_Provider>(context).m1.isDark) ? CupertinoColors.white : CupertinoColors.black),
                                                                        )
                                                                      : (InitialTime.hour >
                                                                              12)
                                                                          ? Text(
                                                                              "${InitialTime.hour - 12} : ${InitialTime.minute} $PeriodName",
                                                                              style: TextStyle(color: (Provider.of<Theme_Provider>(context).m1.isDark) ? CupertinoColors.white : CupertinoColors.black),
                                                                            )
                                                                          : Text(
                                                                              "${InitialTime.hour} : ${InitialTime.minute} $PeriodName",
                                                                              style: TextStyle(color: (Provider.of<Theme_Provider>(context).m1.isDark) ? CupertinoColors.white : CupertinoColors.black),
                                                                            ),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: h * 0.02,
                                                        ),
                                                        CupertinoButton(
                                                          color:
                                                              Color(0xfff5f5fd),
                                                          child: Text(
                                                            "Save",
                                                            style: TextStyle(
                                                                color: CupertinoColors
                                                                    .activeBlue),
                                                          ),
                                                          onPressed: () {
                                                            if (FormKey
                                                                .currentState!
                                                                .validate()) {
                                                              FormKey
                                                                  .currentState!
                                                                  .save();
                                                              Provider.of<AddPageValue_Provider>(
                                                                      context,
                                                                      listen:
                                                                          false)
                                                                  .EditValue(i);

                                                              FullNameController
                                                                  .clear();
                                                              PhoneNumberController
                                                                  .clear();
                                                              ChatController
                                                                  .clear();
                                                              PickedDateEdit =
                                                                  null;
                                                              PeriodName = null;
                                                              time = null;
                                                              Provider.of<AddImage_Provider>(
                                                                      context,
                                                                      listen:
                                                                          false)
                                                                  .ClearImage();
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            }
                                                          },
                                                        ),
                                                        SizedBox(
                                                          height: h * 0.02,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                      child: Icon(CupertinoIcons.eyedropper),
                                    ),
                                    CupertinoActionSheetAction(
                                      onPressed: () {
                                        Provider.of<AddPageValue_Provider>(
                                                context,
                                                listen: false)
                                            .ClearValue(i);
                                        Navigator.of(context).pop();
                                      },
                                      child: Icon(CupertinoIcons.delete),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                          cancelButton: CupertinoActionSheetAction(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            isDestructiveAction: true,
                            child: Text("Cancle"),
                          ),
                        ),
                      );
                    },
                    leading: Transform.scale(
                      scale: 1.6,
                      child: CircleAvatar(
                        foregroundImage: (Provider.of<AddPageValue_Provider>(
                                        context,
                                        listen: false)
                                    .M1
                                    .Images !=
                                null)
                            ? FileImage(
                                File(Provider.of<AddPageValue_Provider>(context,
                                        listen: false)
                                    .M1
                                    .Images[i]),
                              )
                            : null,
                      ),
                    ),
                    title: Text(
                      "   ${Provider.of<AddPageValue_Provider>(context, listen: false).M1.FullName[i]}",
                      style: TextStyle(
                        color: (Provider.of<Theme_Provider>(context).m1.isDark)
                            ? CupertinoColors.white
                            : CupertinoColors.black,
                      ),
                    ),
                    subtitle: Text(
                        "   ${Provider.of<AddPageValue_Provider>(context, listen: false).M1.Chats[i]}"),
                    trailing: GestureDetector(
                      onTap: () async {
                        Uri uri = Uri.parse(
                            "tel:+91${Provider.of<AddPageValue_Provider>(context, listen: false).M1.PhoneNumber[i]}");
                        try {
                          await launchUrl(uri);
                        } catch (e) {
                          print("Exception : $e");
                        }
                      },
                      child: Icon(
                        CupertinoIcons.phone_fill,
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
                itemCount: Provider.of<AddPageValue_Provider>(context)
                    .M1
                    .FullName
                    .length,
                itemBuilder: (context, i) => Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListTile(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(50),
                          ),
                        ),
                        builder: (context) => Container(
                          height: h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50),
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: h * 0.07,
                                foregroundImage: (Provider.of<
                                                    AddPageValue_Provider>(
                                                context,
                                                listen: false)
                                            .M1
                                            .Images !=
                                        null)
                                    ? FileImage(
                                        File(Provider.of<AddPageValue_Provider>(
                                                context,
                                                listen: false)
                                            .M1
                                            .Images[i]),
                                      )
                                    : null,
                              ),
                              SizedBox(
                                height: h * 0.02,
                              ),
                              Text(
                                Provider.of<AddPageValue_Provider>(context,
                                        listen: false)
                                    .M1
                                    .FullName[i],
                                style: TextStyle(
                                  fontSize: h * 0.025,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                Provider.of<AddPageValue_Provider>(context,
                                        listen: false)
                                    .M1
                                    .Chats[i],
                                style: TextStyle(fontSize: h * 0.015),
                              ),
                              SizedBox(
                                height: h * 0.025,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) => StatefulBuilder(
                                          builder: (context, setState) =>
                                              AlertDialog(
                                            content: Container(
                                              width: w,
                                              alignment: Alignment.center,
                                              child: Form(
                                                key: FormKey,
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Center(
                                                        child: CircleAvatar(
                                                          backgroundColor:
                                                              Color(0xffE3DFFD),
                                                          radius: h * 0.09,
                                                          foregroundImage: (Provider.of<
                                                                              AddImage_Provider>(
                                                                          context,
                                                                          listen:
                                                                              false)
                                                                      .a1
                                                                      .image !=
                                                                  null)
                                                              ? FileImage(Provider.of<
                                                                          AddImage_Provider>(
                                                                      context,
                                                                      listen:
                                                                          true)
                                                                  .a1
                                                                  .image as File)
                                                              : null,
                                                          child: IconButton(
                                                            onPressed: () {
                                                              showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) =>
                                                                        AlertDialog(
                                                                  title: Column(
                                                                    children: [
                                                                      Text(
                                                                        "SELECT",
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Color(0xff5F264A),
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            20,
                                                                      ),
                                                                      Row(
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                ListTile(
                                                                              trailing: ElevatedButton(
                                                                                onPressed: () {
                                                                                  Provider.of<AddImage_Provider>(context, listen: false).putImageForCamera();
                                                                                  Navigator.of(context).pop();
                                                                                },
                                                                                child: Icon(
                                                                                  Icons.camera_alt,
                                                                                  color: Color(0xff5F264A),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                ListTile(
                                                                              trailing: ElevatedButton(
                                                                                onPressed: () {
                                                                                  Provider.of<AddImage_Provider>(context, listen: false).putImageForGallery();
                                                                                  Navigator.of(context).pop();
                                                                                },
                                                                                child: Icon(
                                                                                  Icons.photo_album,
                                                                                  color: Color(0xff5F264A),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                            icon: Icon(
                                                              Icons.add_a_photo,
                                                              color: Color(
                                                                  0xff0E8388),
                                                              size: h * 0.055,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: h * 0.01,
                                                      ),
                                                      ElevatedButton(
                                                        onPressed: () {
                                                          showDialog(
                                                            context: context,
                                                            builder:
                                                                (context) =>
                                                                    AlertDialog(
                                                              title: Column(
                                                                children: [
                                                                  Text(
                                                                    "SELECT",
                                                                    style:
                                                                        TextStyle(
                                                                      color: Color(
                                                                          0xff5F264A),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 20,
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            ListTile(
                                                                          trailing:
                                                                              ElevatedButton(
                                                                            onPressed:
                                                                                () {
                                                                              // ImagePicker picker =
                                                                              //     ImagePicker();
                                                                              // XFile? xFile =
                                                                              //     await picker.pickImage(
                                                                              //         source:
                                                                              //             ImageSource.camera);
                                                                              //
                                                                              // String path = xFile!.path;
                                                                              //
                                                                              // setState(() {
                                                                              //   image = File(path);
                                                                              // });
                                                                              Provider.of<AddImage_Provider>(context, listen: false).putImageForCamera();
                                                                              Navigator.of(context).pop();
                                                                            },
                                                                            child:
                                                                                Icon(
                                                                              Icons.camera_alt,
                                                                              color: Color(0xff5F264A),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            ListTile(
                                                                          trailing:
                                                                              ElevatedButton(
                                                                            onPressed:
                                                                                () {
                                                                              // ImagePicker picker =
                                                                              //     ImagePicker();
                                                                              // XFile? xFile =
                                                                              //     await picker.pickImage(
                                                                              //         source:
                                                                              //             ImageSource
                                                                              //                 .gallery);
                                                                              //
                                                                              // String path = xFile!.path;
                                                                              //
                                                                              // setState(() {
                                                                              //   image = File(path);
                                                                              // });
                                                                              Provider.of<AddImage_Provider>(context, listen: false).putImageForGallery();
                                                                              Navigator.of(context).pop();
                                                                            },
                                                                            child:
                                                                                Icon(
                                                                              Icons.photo_album,
                                                                              color: Color(0xff5F264A),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                        child: Text(
                                                          "Add picture",
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xff376ab9),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: h * 0.03,
                                                      ),
                                                      TextFormField(
                                                        controller:
                                                            FullNameController,
                                                        cursorColor:
                                                            Colors.grey,
                                                        textInputAction:
                                                            TextInputAction
                                                                .next,
                                                        validator: (val) {
                                                          if (val!.isEmpty) {
                                                            return "Please Enter First Name";
                                                          } else {
                                                            return null;
                                                          }
                                                        },
                                                        onSaved: (v) {
                                                          fullNameEdit = v;
                                                        },
                                                        decoration:
                                                            InputDecoration(
                                                          label: Text(
                                                              "First Name"),
                                                          labelStyle: TextStyle(
                                                            color: (Provider.of<Theme_Provider>(
                                                                            context)
                                                                        .m1
                                                                        .isDark ==
                                                                    false)
                                                                ? Colors.black
                                                                : Colors.white,
                                                          ),
                                                          prefixIcon: Icon(Icons
                                                              .person_2_outlined),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            borderSide:
                                                                BorderSide(
                                                              color: (Provider.of<Theme_Provider>(
                                                                              context)
                                                                          .m1
                                                                          .isDark ==
                                                                      false)
                                                                  ? Colors.black
                                                                  : Colors
                                                                      .white,
                                                            ),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            borderSide:
                                                                BorderSide(
                                                              color: Colors.blue
                                                                  .shade800,
                                                            ),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            borderSide:
                                                                BorderSide(
                                                              color: Colors.red,
                                                            ),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            borderSide:
                                                                BorderSide(
                                                              color: Colors.red,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: h * 0.02,
                                                      ),
                                                      TextFormField(
                                                        controller:
                                                            PhoneNumberController,
                                                        maxLength: 10,
                                                        cursorColor:
                                                            Colors.grey,
                                                        textInputAction:
                                                            TextInputAction
                                                                .next,
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        inputFormatters: [
                                                          FilteringTextInputFormatter
                                                              .digitsOnly,
                                                        ],
                                                        validator: (val) {
                                                          if (val!.isEmpty) {
                                                            return "Please Enter Phone Number";
                                                          } else {
                                                            return null;
                                                          }
                                                        },
                                                        onSaved: (v) {
                                                          phoneNumberEdit = v;
                                                        },
                                                        decoration:
                                                            InputDecoration(
                                                          label: Text(
                                                              "Phone Number"),
                                                          labelStyle: TextStyle(
                                                            color: (Provider.of<Theme_Provider>(
                                                                            context)
                                                                        .m1
                                                                        .isDark ==
                                                                    false)
                                                                ? Colors.black
                                                                : Colors.white,
                                                          ),
                                                          prefixIcon:
                                                              Icon(Icons.phone),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            borderSide:
                                                                BorderSide(
                                                              color: (Provider.of<Theme_Provider>(
                                                                              context)
                                                                          .m1
                                                                          .isDark ==
                                                                      false)
                                                                  ? Colors.black
                                                                  : Colors
                                                                      .white,
                                                            ),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            borderSide:
                                                                BorderSide(
                                                              color: Colors.blue
                                                                  .shade800,
                                                            ),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            borderSide:
                                                                BorderSide(
                                                              color: Colors.red,
                                                            ),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            borderSide:
                                                                BorderSide(
                                                              color: Colors.red,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: h * 0.01,
                                                      ),
                                                      TextFormField(
                                                        controller:
                                                            ChatController,
                                                        cursorColor:
                                                            Colors.grey,
                                                        textInputAction:
                                                            TextInputAction
                                                                .done,
                                                        validator: (val) {
                                                          if (val!.isEmpty) {
                                                            return "Please Enter Chat Conversation";
                                                          } else {
                                                            return null;
                                                          }
                                                        },
                                                        onSaved: (v) {
                                                          chatEdit = v;
                                                        },
                                                        decoration:
                                                            InputDecoration(
                                                          label: Text(
                                                              "Chat Conversation"),
                                                          labelStyle: TextStyle(
                                                            color: (Provider.of<Theme_Provider>(
                                                                            context)
                                                                        .m1
                                                                        .isDark ==
                                                                    false)
                                                                ? Colors.black
                                                                : Colors.white,
                                                          ),
                                                          prefixIcon: Icon(Icons
                                                              .chat_outlined),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            borderSide:
                                                                BorderSide(
                                                              color: (Provider.of<Theme_Provider>(
                                                                              context)
                                                                          .m1
                                                                          .isDark ==
                                                                      false)
                                                                  ? Colors.black
                                                                  : Colors
                                                                      .white,
                                                            ),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            borderSide:
                                                                BorderSide(
                                                              color: Colors.blue
                                                                  .shade800,
                                                            ),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            borderSide:
                                                                BorderSide(
                                                              color: Colors.red,
                                                            ),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            borderSide:
                                                                BorderSide(
                                                              color: Colors.red,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: h * 0.01,
                                                      ),
                                                      Row(
                                                        children: [
                                                          IconButton(
                                                            onPressed:
                                                                () async {
                                                              DateTime? date =
                                                                  await showDatePicker(
                                                                context:
                                                                    context,
                                                                initialDate:
                                                                    Date,
                                                                firstDate:
                                                                    DateTime(
                                                                        2000),
                                                                lastDate:
                                                                    DateTime(
                                                                        2024),
                                                                cancelText:
                                                                    "BACK",
                                                                confirmText:
                                                                    "CONTINUE",
                                                                initialDatePickerMode:
                                                                    DatePickerMode
                                                                        .day,
                                                                initialEntryMode:
                                                                    DatePickerEntryMode
                                                                        .calendarOnly,
                                                                builder:
                                                                    (context,
                                                                        child) {
                                                                  return Theme(
                                                                    data: Theme.of(
                                                                            context)
                                                                        .copyWith(
                                                                      colorScheme:
                                                                          ColorScheme
                                                                              .light(
                                                                        primary:
                                                                            Colors.amberAccent,
                                                                        onPrimary:
                                                                            Colors.redAccent,
                                                                        onSurface:
                                                                            Colors.blueAccent,
                                                                      ),
                                                                      textButtonTheme:
                                                                          TextButtonThemeData(
                                                                        style: TextButton
                                                                            .styleFrom(
                                                                          primary:
                                                                              Colors.red, // button text color
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        child!,
                                                                  );
                                                                },
                                                                // selectableDayPredicate: (day) {
                                                                //   if(day.isAfter(DateTime.now().subtract(Duration(days: 1))) && day.isBefore(DateTime.now().add(Duration(days: 10)))){
                                                                //     return true;
                                                                //   }else {
                                                                //     return false;
                                                                //   }
                                                                // }
                                                              );

                                                              setState(() {
                                                                if (date !=
                                                                    null) {
                                                                  PickedDateEdit =
                                                                      date;
                                                                }
                                                              });
                                                            },
                                                            icon: Icon(
                                                              Icons
                                                                  .calendar_month_rounded,
                                                              size: h * 0.03,
                                                            ),
                                                          ),
                                                          (PickedDateEdit !=
                                                                  null)
                                                              ? Text(
                                                                  "${PickedDateEdit?.day} / ${PickedDateEdit?.month} / ${PickedDateEdit?.year}")
                                                              : Text(
                                                                  "Pick Date"),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: h * 0.01,
                                                      ),
                                                      Row(
                                                        children: [
                                                          IconButton(
                                                            onPressed:
                                                                () async {
                                                              time =
                                                                  await showTimePicker(
                                                                context:
                                                                    context,
                                                                initialTime:
                                                                    TimeEdit,
                                                              );

                                                              if (time !=
                                                                  null) {
                                                                setState(() {
                                                                  TimeEdit =
                                                                      time!;
                                                                });
                                                              }
                                                            },
                                                            icon: Icon(
                                                              Icons
                                                                  .watch_later_outlined,
                                                              size: h * 0.03,
                                                            ),
                                                          ),
                                                          (time != null)
                                                              ? (TimeEdit.periodOffset ==
                                                                      0)
                                                                  ? Text(
                                                                      "${TimeEdit.hour} : ${TimeEdit.minute}  ${TimeEdit.period.name}")
                                                                  : (Time.hour >
                                                                          12)
                                                                      ? Text(
                                                                          "${TimeEdit.hour - 12} : ${TimeEdit.minute}  ${TimeEdit.period.name}")
                                                                      : Text(
                                                                          "${TimeEdit.hour} : ${TimeEdit.minute}  ${TimeEdit.period.name}")
                                                              : Text(
                                                                  "Pick Time"),
                                                        ],
                                                      ),
                                                      OutlinedButton(
                                                        onPressed: () {
                                                          if (FormKey
                                                              .currentState!
                                                              .validate()) {
                                                            FormKey
                                                                .currentState!
                                                                .save();
                                                            Provider.of<AddPageValue_Provider>(
                                                                    context,
                                                                    listen:
                                                                        false)
                                                                .EditValue(i);

                                                            FullNameController
                                                                .clear();
                                                            PhoneNumberController
                                                                .clear();
                                                            ChatController
                                                                .clear();
                                                            PickedDateEdit =
                                                                null;
                                                            time = null;
                                                            Provider.of<AddImage_Provider>(
                                                                    context,
                                                                    listen:
                                                                        false)
                                                                .ClearImage();
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          }
                                                        },
                                                        child: Text("Save"),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    icon: Icon(Icons.edit),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      Provider.of<AddPageValue_Provider>(
                                              context,
                                              listen: false)
                                          .ClearValue(i);
                                      Navigator.of(context).pop();
                                    },
                                    icon: Icon(Icons.delete),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: h * 0.03,
                              ),
                              OutlinedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(
                                    color: Colors.purpleAccent,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    leading: Transform.scale(
                      scale: 1.6,
                      child: CircleAvatar(
                        foregroundImage:
                            (Provider.of<AddPageValue_Provider>(context)
                                        .M1
                                        .Images !=
                                    null)
                                ? FileImage(
                                    File(Provider.of<AddPageValue_Provider>(
                                            context,
                                            listen: false)
                                        .M1
                                        .Images[i]),
                                  )
                                : null,
                      ),
                    ),
                    title: Text(
                        "   ${Provider.of<AddPageValue_Provider>(context, listen: false).M1.FullName[i]}"),
                    subtitle: Text(
                        "   ${Provider.of<AddPageValue_Provider>(context, listen: false).M1.Chats[i]}"),
                    trailing: IconButton(
                      onPressed: () async {
                        Uri uri = Uri.parse(
                            "tel:+91${Provider.of<AddPageValue_Provider>(context, listen: false).M1.PhoneNumber[i]}");
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
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:platform_convert_app_code/Controllers/AddImage_Provider.dart';
import 'package:platform_convert_app_code/Controllers/AddPageValue_Provider.dart';
import 'package:platform_convert_app_code/utills/All_Atributes.dart';
import 'package:provider/provider.dart';

import '../Controllers/ImagePicker_Provider.dart';
import '../Controllers/Theme_Provider.dart';
import '../Controllers/Ui_Provider.dart';

class AddContacts extends StatefulWidget {
  const AddContacts({Key? key}) : super(key: key);

  @override
  State<AddContacts> createState() => _AddContactsState();
}

class _AddContactsState extends State<AddContacts> {
  GlobalKey<FormState> FormKey = GlobalKey<FormState>();

  DateTime InitialTime = DateTime.now();
  String? PeriodName;

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;

    return (Provider.of<Ui_Provider>(context).u1.isUi)
        ? SingleChildScrollView(
            child: Form(
              key: FormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: h * 0.05,
                  ),
                  Center(
                    child: CircleAvatar(
                      radius: h * 0.08,
                      foregroundImage: (Provider.of<AddImage_Provider>(context,
                                      listen: false)
                                  .a1
                                  .image !=
                              null)
                          ? FileImage(Provider.of<AddImage_Provider>(context,
                                  listen: true)
                              .a1
                              .image as File)
                          : null,
                      backgroundColor: Color(0xffE3DFFD),
                      child: CupertinoButton(
                        child: Icon(CupertinoIcons.camera, size: h * 0.05),
                        onPressed: () {
                          showCupertinoDialog(
                            context: context,
                            builder: (context) => CupertinoAlertDialog(
                              title: Center(
                                child: Text(
                                  "SELECT",
                                  style: TextStyle(
                                    color: Color(0xff5F264A),
                                  ),
                                ),
                              ),
                              actions: [
                                CupertinoDialogAction(
                                  child: Icon(
                                    CupertinoIcons.camera_fill,
                                    color: Color(0xff5F264A),
                                  ),
                                  onPressed: () {
                                    Provider.of<AddImage_Provider>(context,
                                            listen: false)
                                        .putImageForCamera();
                                    Navigator.of(context).pop();
                                  },
                                ),
                                CupertinoDialogAction(
                                  child: Icon(
                                    CupertinoIcons.photo,
                                    color: Color(0xff5F264A),
                                  ),
                                  onPressed: () {
                                    Provider.of<AddImage_Provider>(context,
                                            listen: false)
                                        .putImageForGallery();
                                    Provider.of<ImagePicker_Provider>(context,
                                            listen: false)
                                        .putImageForGallery();
                                    Navigator.of(context).pop();
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
                    height: h * 0.01,
                  ),
                  CupertinoButton(
                    color: Color(0xfff5f5fd),
                    padding: EdgeInsets.only(left: 15, right: 15),
                    borderRadius: BorderRadius.circular(20),
                    child: Text(
                      "Add picture",
                      style: TextStyle(
                        fontSize: h * 0.018,
                        color: Color(0xff376ab9),
                      ),
                    ),
                    onPressed: () {
                      showCupertinoDialog(
                        context: context,
                        builder: (context) => CupertinoAlertDialog(
                          title: Center(
                            child: Text(
                              "SELECT",
                              style: TextStyle(
                                color: Color(0xff5F264A),
                              ),
                            ),
                          ),
                          actions: [
                            CupertinoDialogAction(
                              child: Icon(
                                CupertinoIcons.camera_fill,
                                color: Color(0xff5F264A),
                              ),
                              onPressed: () {
                                Provider.of<AddImage_Provider>(context,
                                        listen: false)
                                    .putImageForCamera();
                                Navigator.of(context).pop();
                              },
                            ),
                            CupertinoDialogAction(
                              child: Icon(
                                CupertinoIcons.photo,
                                color: Color(0xff5F264A),
                              ),
                              onPressed: () {
                                Provider.of<AddImage_Provider>(context,
                                        listen: false)
                                    .putImageForGallery();
                                Provider.of<ImagePicker_Provider>(context,
                                        listen: false)
                                    .putImageForGallery();
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: h * 0.05,
                  ),
                  CupertinoTextFormFieldRow(
                    textInputAction: TextInputAction.next,
                    prefix: Icon(
                      CupertinoIcons.person_alt,
                      color: CupertinoColors.systemTeal,
                    ),
                    controller: FullNameController,
                    placeholderStyle: TextStyle(
                      color: CupertinoColors.placeholderText,
                    ),
                    style: TextStyle(
                      color: CupertinoColors.placeholderText
                    ),
                    onSaved: (val) {
                      fullName = val;
                      print(val);
                    },
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter Your Full Name";
                      } else {
                        return null;
                      }
                    },
                    padding: EdgeInsets.only(left: 20, right: 20),
                    placeholder: "Name",
                    decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        style: BorderStyle.solid,
                        color: CupertinoColors.inactiveGray,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  CupertinoTextFormFieldRow(
                    prefix: Icon(
                      CupertinoIcons.phone,
                      color: CupertinoColors.systemTeal,
                    ),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    controller: PhoneNumberController,
                    placeholderStyle: TextStyle(
                      color: CupertinoColors.placeholderText,
                    ),
                    style: TextStyle(
                        color: CupertinoColors.placeholderText
                    ),
                    onSaved: (val) {
                      phoneNumber = val;
                      print(val);
                    },
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter Your Phone Number";
                      } else {
                        return null;
                      }
                    },
                    padding: EdgeInsets.only(left: 20, right: 20),
                    placeholder: "Phone Number",
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        style: BorderStyle.solid,
                        color: CupertinoColors.inactiveGray,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  CupertinoTextFormFieldRow(
                    prefix: Icon(
                      CupertinoIcons.chat_bubble,
                      color: CupertinoColors.systemTeal,
                    ),
                    textInputAction: TextInputAction.done,
                    controller: ChatController,
                    placeholderStyle: TextStyle(
                      color: CupertinoColors.placeholderText,
                    ),
                    style: TextStyle(
                        color: CupertinoColors.placeholderText
                    ),
                    onSaved: (val) {
                      chat = val;
                      print(val);
                    },
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter Your Chat Conversation";
                      } else {
                        return null;
                      }
                    },
                    padding: EdgeInsets.only(left: 20, right: 20),
                    placeholder: "Chat Conversation",
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        style: BorderStyle.solid,
                        color: CupertinoColors.inactiveGray,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            showCupertinoModalPopup(
                              context: context,
                              builder: (context) => Container(
                                height: h * 0.35,
                                child: CupertinoDatePicker(
                                  onDateTimeChanged: (val) {
                                    setState(() {
                                      PickedDate = val;
                                    });
                                  },
                                  initialDateTime: Date,
                                  minimumYear: 2000,
                                  maximumYear: 2024,
                                  use24hFormat: false,
                                  mode: CupertinoDatePickerMode.date,
                                  backgroundColor: CupertinoColors.separator,
                                ),
                              ),
                            );
                          },
                          child: Icon(
                            CupertinoIcons.calendar_today,
                            color: CupertinoColors.systemTeal,
                          ),
                        ),
                        SizedBox(
                          width: w * 0.02,
                        ),
                        (PickedDate != null)
                            ? Text(
                                "${PickedDate?.day} / ${PickedDate?.month} / ${PickedDate?.year}",
                                style: TextStyle(
                                    color: (Provider.of<Theme_Provider>(context)
                                            .m1
                                            .isDark)
                                        ? CupertinoColors.white
                                        : CupertinoColors.black),
                              )
                            : Text(
                                "Pick Date",
                                style: TextStyle(
                                    color: (Provider.of<Theme_Provider>(context)
                                            .m1
                                            .isDark)
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
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            showCupertinoModalPopup(
                              context: context,
                              builder: (context) => Container(
                                height: h * 0.35,
                                child: CupertinoDatePicker(
                                  onDateTimeChanged: (val) {
                                    setState(() {
                                      InitialTime = val;

                                      if (InitialTime.hour >= 12) {
                                        PeriodName = "PM";
                                      } else {
                                        PeriodName = "AM";
                                      }
                                    });
                                  },
                                  initialDateTime: InitialTime,
                                  mode: CupertinoDatePickerMode.time,
                                  backgroundColor: CupertinoColors.separator,
                                ),
                              ),
                            );
                          },
                          child: Icon(
                            CupertinoIcons.time,
                            color: CupertinoColors.systemTeal,
                          ),
                        ),
                        SizedBox(
                          width: w * 0.02,
                        ),
                        (PeriodName == null)
                            ? Text(
                          "Pick Time",
                          style: TextStyle(
                              color: (Provider.of<Theme_Provider>(context)
                                  .m1
                                  .isDark)
                                  ? CupertinoColors.white
                                  : CupertinoColors.black),
                        )
                            : (PeriodName == "AM")
                            ? Text(
                          "${InitialTime.hour} : ${InitialTime.minute} $PeriodName",
                          style: TextStyle(
                              color: (Provider.of<Theme_Provider>(
                                  context)
                                  .m1
                                  .isDark)
                                  ? CupertinoColors.white
                                  : CupertinoColors.black),
                        )
                            : (InitialTime.hour > 12)
                            ? Text(
                          "${InitialTime.hour - 12} : ${InitialTime.minute} $PeriodName",
                          style: TextStyle(
                              color: (Provider.of<Theme_Provider>(
                                  context)
                                  .m1
                                  .isDark)
                                  ? CupertinoColors.white
                                  : CupertinoColors.black),
                        )
                            : Text(
                          "${InitialTime.hour} : ${InitialTime.minute} $PeriodName",
                          style: TextStyle(
                              color: (Provider.of<Theme_Provider>(
                                  context)
                                  .m1
                                  .isDark)
                                  ? CupertinoColors.white
                                  : CupertinoColors.black),
                        ),
                      ],
                    ),
                  ),
                  CupertinoButton(
                    color: Color(0xfff5f5fd),
                    child: Text(
                      "Save",
                      style: TextStyle(color: CupertinoColors.activeBlue),
                    ),
                    onPressed: () {
                      if (FormKey.currentState!.validate()) {
                        FormKey.currentState!.save();
                        Provider.of<AddPageValue_Provider>(context,listen: false).SaveValueAddPage();

                        FullNameController.clear();
                        PhoneNumberController.clear();
                        ChatController.clear();
                        PickedDate = null;
                        time = null;
                        Provider.of<AddImage_Provider>(context,listen: false).ClearImage();
                      }
                    },
                  ),
                ],
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: FormKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(
                      child: CircleAvatar(
                        backgroundColor: Color(0xffE3DFFD),
                        radius: h * 0.09,
                        foregroundImage: (Provider.of<AddImage_Provider>(
                                        context,
                                        listen: false)
                                    .a1
                                    .image !=
                                null)
                            ? FileImage(Provider.of<AddImage_Provider>(context,
                                    listen: true)
                                .a1
                                .image as File)
                            : null,
                        child: IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Column(
                                  children: [
                                    Text(
                                      "SELECT",
                                      style: TextStyle(
                                        color: Color(0xff5F264A),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: ListTile(
                                            trailing: ElevatedButton(
                                              onPressed: () {
                                                Provider.of<AddImage_Provider>(
                                                        context,
                                                        listen: false)
                                                    .putImageForCamera();
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
                                          child: ListTile(
                                            trailing: ElevatedButton(
                                              onPressed: () {
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
                                                Provider.of<AddImage_Provider>(
                                                        context,
                                                        listen: false)
                                                    .putImageForGallery();
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
                            color: Color(0xff0E8388),
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
                          builder: (context) => AlertDialog(
                            title: Column(
                              children: [
                                Text(
                                  "SELECT",
                                  style: TextStyle(
                                    color: Color(0xff5F264A),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: ListTile(
                                        trailing: ElevatedButton(
                                          onPressed: () {
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
                                            Provider.of<AddImage_Provider>(
                                                    context,
                                                    listen: false)
                                                .putImageForCamera();
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
                                      child: ListTile(
                                        trailing: ElevatedButton(
                                          onPressed: () {
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
                                            Provider.of<AddImage_Provider>(
                                                    context,
                                                    listen: false)
                                                .putImageForGallery();
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
                      child: Text(
                        "Add picture",
                        style: TextStyle(
                          color: Color(0xff376ab9),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: h * 0.03,
                    ),
                    TextFormField(
                      controller: FullNameController,
                      cursorColor: Colors.grey,
                      textInputAction: TextInputAction.next,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please Enter First Name";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (v) {
                        fullName = v;
                      },
                      decoration: InputDecoration(
                        label: Text("First Name"),
                        labelStyle: TextStyle(
                          color:
                              (Provider.of<Theme_Provider>(context).m1.isDark ==
                                      false)
                                  ? Colors.black
                                  : Colors.white,
                        ),
                        prefixIcon: Icon(Icons.person_2_outlined),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: (Provider.of<Theme_Provider>(context)
                                        .m1
                                        .isDark ==
                                    false)
                                ? Colors.black
                                : Colors.white,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.blue.shade800,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: h * 0.02,
                    ),
                    TextFormField(
                      controller: PhoneNumberController,
                      maxLength: 10,
                      cursorColor: Colors.grey,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please Enter Phone Number";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (v) {
                        phoneNumber = v;
                      },
                      decoration: InputDecoration(
                        label: Text("Phone Number"),
                        labelStyle: TextStyle(
                          color:
                              (Provider.of<Theme_Provider>(context).m1.isDark ==
                                      false)
                                  ? Colors.black
                                  : Colors.white,
                        ),
                        prefixIcon: Icon(Icons.phone),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: (Provider.of<Theme_Provider>(context)
                                        .m1
                                        .isDark ==
                                    false)
                                ? Colors.black
                                : Colors.white,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.blue.shade800,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: h * 0.01,
                    ),
                    TextFormField(
                      controller: ChatController,
                      cursorColor: Colors.grey,
                      textInputAction: TextInputAction.done,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please Enter Chat Conversation";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (v) {
                        chat = v;
                      },
                      decoration: InputDecoration(
                        label: Text("Chat Conversation"),
                        labelStyle: TextStyle(
                          color:
                              (Provider.of<Theme_Provider>(context).m1.isDark ==
                                      false)
                                  ? Colors.black
                                  : Colors.white,
                        ),
                        prefixIcon: Icon(Icons.chat_outlined),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: (Provider.of<Theme_Provider>(context)
                                        .m1
                                        .isDark ==
                                    false)
                                ? Colors.black
                                : Colors.white,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.blue.shade800,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
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
                          onPressed: () async {

                            print("===========================");
                            print(Provider.of<AddImage_Provider>(
                                context,
                                listen: false).a1.image.path);
                            print("===========================");

                            DateTime? date = await showDatePicker(
                              context: context,
                              initialDate: Date,
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2024),
                              cancelText: "BACK",
                              confirmText: "CONTINUE",
                              initialDatePickerMode: DatePickerMode.day,
                              initialEntryMode:
                                  DatePickerEntryMode.calendarOnly,
                              builder: (context, child) {
                                return Theme(
                                  data: Theme.of(context).copyWith(
                                    colorScheme: ColorScheme.light(
                                      primary: Colors.amberAccent,
                                      onPrimary: Colors.redAccent,
                                      onSurface: Colors.blueAccent,
                                    ),
                                    textButtonTheme: TextButtonThemeData(
                                      style: TextButton.styleFrom(
                                        primary:
                                            Colors.red, // button text color
                                      ),
                                    ),
                                  ),
                                  child: child!,
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
                              if (date != null) {
                                PickedDate = date;
                              }
                            });
                          },
                          icon: Icon(
                            Icons.calendar_month_rounded,
                            size: h * 0.03,
                          ),
                        ),
                        (PickedDate != null)
                            ? Text(
                                "${PickedDate?.day} / ${PickedDate?.month} / ${PickedDate?.year}")
                            : Text("Pick Date"),
                      ],
                    ),
                    SizedBox(
                      height: h * 0.01,
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () async {
                             time = await showTimePicker(
                              context: context,
                              initialTime: Time,
                            );

                            if (time != null) {
                              setState(() {
                                Time = time!;
                              });
                            }
                          },
                          icon: Icon(
                            Icons.watch_later_outlined,
                            size: h * 0.03,
                          ),
                        ),
                        (time != null)
                            ? (Time.periodOffset == 0)
                                ? Text(
                                    "${Time.hour} : ${Time.minute}  ${Time.period.name}")
                                : (Time.hour > 12)
                                    ? Text(
                                        "${Time.hour - 12} : ${Time.minute}  ${Time.period.name}")
                                    : Text(
                                        "${Time.hour} : ${Time.minute}  ${Time.period.name}")
                            : Text("Pick Time"),
                      ],
                    ),
                    OutlinedButton(
                      onPressed: () {
                        if (FormKey.currentState!.validate()) {
                          FormKey.currentState!.save();
                          Provider.of<AddPageValue_Provider>(context,listen: false).SaveValueAddPage();

                          FullNameController.clear();
                          PhoneNumberController.clear();
                          ChatController.clear();
                          PickedDate = null;
                          time = null;
                          Provider.of<AddImage_Provider>(context,listen: false).ClearImage();

                          print(Provider.of<AddPageValue_Provider>(context,listen: false).M1.FullName);
                          print(Provider.of<AddPageValue_Provider>(context,listen: false).M1.PhoneNumber);
                          print(Provider.of<AddPageValue_Provider>(context,listen: false).M1.Chats);
                          print(Provider.of<AddPageValue_Provider>(context,listen: false).M1.Dates);
                          print(Provider.of<AddPageValue_Provider>(context,listen: false).M1.Months);
                          print(Provider.of<AddPageValue_Provider>(context,listen: false).M1.Years);
                          print(Provider.of<AddPageValue_Provider>(context,listen: false).M1.Hours);
                          print(Provider.of<AddPageValue_Provider>(context,listen: false).M1.Minits);
                          print(Provider.of<AddPageValue_Provider>(context,listen: false).M1.Images);
                        }
                      },
                      child: Text("Save"),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}

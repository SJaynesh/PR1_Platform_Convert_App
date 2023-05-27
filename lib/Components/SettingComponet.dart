import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:platform_convert_app_code/Controllers/ImagePicker_Provider.dart';
import 'package:platform_convert_app_code/Controllers/Setting_Provider.dart';
import 'package:platform_convert_app_code/Controllers/TextFieldValue_Provider.dart';
import 'package:provider/provider.dart';

import '../Controllers/Theme_Provider.dart';
import '../Controllers/Ui_Provider.dart';


import '../utills/All_Atributes.dart';

class SettingComponet extends StatefulWidget {
  const SettingComponet({Key? key}) : super(key: key);

  @override
  State<SettingComponet> createState() => _SettingComponetState();
}

class _SettingComponetState extends State<SettingComponet> {
  GlobalKey<FormState> FormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;

    return (Provider.of<Ui_Provider>(context).u1.isUi)
        ? Form(
            key: FormKey,
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: h * 0.1,
                    ),
                    CupertinoListTile(
                      leading: Icon(
                        CupertinoIcons.person_alt,
                        color: (Provider.of<Theme_Provider>(context).m1.isDark)
                            ? CupertinoColors.white
                            : CupertinoColors.systemTeal,
                        size: h * 0.04,
                      ),
                      title: Text(
                        "Profile",
                        style: TextStyle(
                          fontSize: h * 0.03,
                          color:
                              (Provider.of<Theme_Provider>(context).m1.isDark)
                                  ? CupertinoColors.white
                                  : CupertinoColors.black,
                        ),
                      ),
                      subtitle: Text(
                        "Update Profile Data",
                        style: TextStyle(
                          fontSize: h * 0.02,
                          // color: Colors.black54,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      trailing: CupertinoSwitch(
                        activeColor: CupertinoColors.systemPurple,
                        value: Provider.of<Setting_Provider>(context).s1.isOn,
                        onChanged: (val) {
                          Provider.of<Setting_Provider>(context, listen: false)
                              .changeIsOnValue();
                        },
                      ),
                    ),
                    SizedBox(
                      height: h * 0.015,
                    ),
                    (Provider.of<Setting_Provider>(context).s1.isOn)
                        ? Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: h * 0.08,
                                  foregroundImage:
                                      (Provider.of<ImagePicker_Provider>(
                                                      context,
                                                      listen: false)
                                                  .I1
                                                  .image !=
                                              null)
                                          ? FileImage(
                                              Provider.of<ImagePicker_Provider>(
                                                      context,
                                                      listen: true)
                                                  .I1
                                                  .image as File)
                                          : null,
                                  backgroundColor: Color(0xffE3DFFD),
                                  child: CupertinoButton(
                                      child: Icon(CupertinoIcons.camera,
                                          size: h * 0.05),
                                      onPressed: () {
                                        showCupertinoDialog(
                                          context: context,
                                          builder: (context) =>
                                              CupertinoAlertDialog(
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
                                                  Provider.of<ImagePicker_Provider>(
                                                          context,
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
                                                  // ImagePicker picker =
                                                  //     ImagePicker();
                                                  // XFile? xFile =
                                                  //     await picker.pickImage(
                                                  //         source:
                                                  //             ImageSource.gallery);
                                                  //
                                                  // String path = xFile!.path;
                                                  //
                                                  // setState(() {
                                                  //   image = File(path);
                                                  // });
                                                  Provider.of<ImagePicker_Provider>(
                                                          context,
                                                          listen: false)
                                                      .putImageForGallery();
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
                                ),
                                SizedBox(
                                  height: h * 0.02,
                                ),
                                CupertinoTextFormFieldRow(
                                  style: TextStyle(
                                    color: (Provider.of<Theme_Provider>(context)
                                            .m1
                                            .isDark)
                                        ? CupertinoColors.white
                                        : CupertinoColors.black,
                                  ),
                                  controller:
                                      Provider.of<TextFieldValue_Provider>(
                                              context)
                                          .T1
                                          .NameController,
                                  placeholderStyle: TextStyle(
                                    color: CupertinoColors.inactiveGray,
                                  ),
                                  onSaved: (val) {
                                    Name = val;
                                    print(val);
                                  },
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "Enter Your Name";
                                    } else {
                                      return null;
                                    }
                                  },
                                  textAlign: TextAlign.center,
                                  placeholder: "Enter Your Name",
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      style: BorderStyle.none,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: h * 0.02,
                                ),
                                CupertinoTextFormFieldRow(
                                  style: TextStyle(
                                    color: CupertinoColors.secondaryLabel,
                                  ),
                                  controller:
                                      Provider.of<TextFieldValue_Provider>(
                                              context)
                                          .T1
                                          .BioDataController,
                                  placeholderStyle: TextStyle(
                                    color: CupertinoColors.inactiveGray,
                                  ),
                                  onSaved: (val) {
                                    Bio = val;
                                    print(val);
                                  },
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "Enter Your BioData";
                                    } else {
                                      return null;
                                    }
                                  },
                                  textAlign: TextAlign.center,
                                  placeholder: "Enter Your BioData",
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      style: BorderStyle.none,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: h * 0.015,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    OutlinedButton(
                                      style: ButtonStyle(
                                        side: MaterialStateProperty.all(
                                            BorderSide.none),
                                      ),
                                      onPressed: () {
                                        if (FormKey.currentState!.validate()) {
                                          FormKey.currentState!.save();
                                          Provider.of<TextFieldValue_Provider>(
                                                  context,
                                                  listen: false)
                                              .ChangedValue();
                                        }
                                      },
                                      child: Text(
                                        "SAVE",
                                        style: TextStyle(
                                          color: Color(0xff0E8388),
                                        ),
                                      ),
                                    ),
                                    OutlinedButton(
                                      style: ButtonStyle(
                                        side: MaterialStateProperty.all(
                                            BorderSide.none),
                                      ),
                                      onPressed: () {
                                        Provider.of<ImagePicker_Provider>(context, listen: false).ClearImage();
                                        Provider.of<TextFieldValue_Provider>(context, listen: false).ClearController();
                                      },
                                      child: Text(
                                        "CLEAR",
                                        style: TextStyle(
                                          color: Color(0xff0E8388),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        : Container(),
                    SizedBox(
                      height: h * 0.025,
                    ),
                    CupertinoListTile(
                      leading: (Provider.of<Theme_Provider>(context).m1.isDark)
                          ? Icon(
                              Icons.emoji_objects,
                              color: CupertinoColors.white,
                              size: h * 0.04,
                            )
                          : Icon(
                              Icons.dark_mode,
                              color: CupertinoColors.systemTeal,
                              size: h * 0.04,
                            ),
                      title: Text(
                        "Theme",
                        style: TextStyle(
                          fontSize: h * 0.03,
                          color:
                              (Provider.of<Theme_Provider>(context).m1.isDark)
                                  ? CupertinoColors.white
                                  : CupertinoColors.black,
                        ),
                      ),
                      subtitle: Text(
                        "Change Theme",
                        style: TextStyle(
                          fontSize: h * 0.02,
                          // color: Colors.black54,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      trailing: CupertinoSwitch(
                        activeColor: CupertinoColors.systemPurple,
                        value: Provider.of<Theme_Provider>(context).m1.isDark,
                        onChanged: (val) {
                          Provider.of<Theme_Provider>(context, listen: false)
                              .changeTheme();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : Form(
            key: FormKey,
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: h * 0.02,
                    ),
                    Divider(
                      color: Colors.grey.shade300,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.person_2,
                        color: (Provider.of<Theme_Provider>(context).m1.isDark)
                            ? Colors.white
                            : Colors.grey.shade400,
                        size: h * 0.04,
                      ),
                      title: Text(
                        "Profile",
                        style: TextStyle(
                          fontSize: h * 0.03,
                          // color: Colors.black,
                        ),
                      ),
                      subtitle: Text(
                        "Update Profile Data",
                        style: TextStyle(
                          fontSize: h * 0.02,
                          // color: Colors.black54,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      trailing: Switch(
                        value: Provider.of<Setting_Provider>(context).s1.isOn,
                        onChanged: (val) {
                          Provider.of<Setting_Provider>(context, listen: false)
                              .changeIsOnValue();
                        },
                      ),
                    ),
                    SizedBox(
                      height: h * 0.015,
                    ),
                    (Provider.of<Setting_Provider>(context).s1.isOn)
                        ? Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: h * 0.08,
                                  backgroundColor: Color(0xffE3DFFD),
                                  foregroundImage:
                                      (Provider.of<ImagePicker_Provider>(
                                                      context,
                                                      listen: false)
                                                  .I1
                                                  .image != null)
                                          ? FileImage(
                                              Provider.of<ImagePicker_Provider>(
                                                      context,
                                                      listen: true)
                                                  .I1
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
                                                          Provider.of<ImagePicker_Provider>(
                                                                  context,
                                                                  listen: false)
                                                              .putImageForCamera();
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: Icon(
                                                          Icons.camera_alt,
                                                          color:
                                                              Color(0xff5F264A),
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
                                                          Provider.of<ImagePicker_Provider>(
                                                                  context,
                                                                  listen: false)
                                                              .putImageForGallery();
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: Icon(
                                                          Icons.photo_album,
                                                          color:
                                                              Color(0xff5F264A),
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
                                TextFormField(
                                  onSaved: (val) {
                                    Name = val;
                                  },
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "Enter Your Name";
                                    } else {
                                      return null;
                                    }
                                  },
                                  controller:
                                      Provider.of<TextFieldValue_Provider>(
                                              context)
                                          .T1
                                          .NameController,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    hintText: "Enter Your Name",
                                    helperStyle: TextStyle(
                                      color: Colors.black,
                                    ),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  ),
                                ),
                                SizedBox(
                                  height: h * 0.015,
                                ),
                                TextFormField(
                                  controller:
                                      Provider.of<TextFieldValue_Provider>(
                                              context)
                                          .T1
                                          .BioDataController,
                                  onSaved: (val) {
                                    Bio = val;
                                  },
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "Enter Your Bio";
                                    } else {
                                      return null;
                                    }
                                  },
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    hintText: "Enter Your BioData",
                                    helperStyle: TextStyle(
                                      color: Colors.black,
                                    ),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  ),
                                ),
                                SizedBox(
                                  height: h * 0.015,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    OutlinedButton(
                                      style: ButtonStyle(
                                        side: MaterialStateProperty.all(
                                            BorderSide.none),
                                      ),
                                      onPressed: () {
                                        if (FormKey.currentState!.validate()) {
                                          FormKey.currentState!.save();
                                          Provider.of<TextFieldValue_Provider>(
                                                  context,
                                                  listen: false)
                                              .ChangedValue();
                                        }
                                      },
                                      child: Text(
                                        "SAVE",
                                        style: TextStyle(
                                          color: Color(0xff0E8388),
                                        ),
                                      ),
                                    ),
                                    OutlinedButton(
                                      style: ButtonStyle(
                                        side: MaterialStateProperty.all(
                                            BorderSide.none),
                                      ),
                                      onPressed: () {
                                        Provider.of<ImagePicker_Provider>(context, listen: false).ClearImage();
                                        Provider.of<TextFieldValue_Provider>(context, listen: false).ClearController();
                                      },
                                      child: Text(
                                        "CLEAR",
                                        style: TextStyle(
                                          color: Color(0xff0E8388),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        : Container(),
                    Divider(
                      color: Colors.grey.shade300,
                    ),
                    SizedBox(
                      height: h * 0.01,
                    ),
                    ListTile(
                      leading: (Provider.of<Theme_Provider>(context).m1.isDark)
                          ? Icon(
                              Icons.emoji_objects,
                              color: Colors.white,
                              size: h * 0.04,
                            )
                          : Icon(
                              Icons.dark_mode,
                              color: Colors.black45,
                              size: h * 0.04,
                            ),
                      title: Text(
                        "Theme",
                        style: TextStyle(
                          fontSize: h * 0.03,
                          // color: Colors.black,
                        ),
                      ),
                      subtitle: Text(
                        "Change Theme",
                        style: TextStyle(
                          fontSize: h * 0.02,
                          // color: Colors.black54,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      trailing: Switch(
                        value: Provider.of<Theme_Provider>(context).m1.isDark,
                        onChanged: (val) {
                          Provider.of<Theme_Provider>(context, listen: false)
                              .changeTheme();
                        },
                      ),
                    ),
                    SizedBox(
                      height: h * 0.01,
                    ),
                    Divider(
                      color: Colors.grey.shade300,
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
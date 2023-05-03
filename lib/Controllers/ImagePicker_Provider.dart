import 'dart:io';

import 'package:flutter/material.dart';
import 'package:platform_convert_app_code/Models/ImagePicker_Model.dart';

import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImagePicker_Provider extends ChangeNotifier {
  ImagePicker_Model I1;

  ImagePicker_Provider({required this.I1});

  putImageForCamera() async {
    ImagePicker picker = ImagePicker();

    XFile? xFile = await picker.pickImage(source: ImageSource.camera);

    String path = xFile!.path;

    I1.image = File(path);

    SharedPreferences Pref = await SharedPreferences.getInstance();

    await Pref.setString('Image', I1.image.path);

    notifyListeners();
  }

  putImageForGallery() async {
    ImagePicker picker = ImagePicker();

    XFile? xFile = await picker.pickImage(source: ImageSource.gallery);

    String path = xFile!.path;

    I1.image = File(path);

    SharedPreferences Pref = await SharedPreferences.getInstance();

    await Pref.setString('Image', I1.image.path);

    notifyListeners();
  }

  ClearImage() async{
    I1.image = File("");
    SharedPreferences Pref = await SharedPreferences.getInstance();

    await Pref.setString('Image', I1.image.path);
    notifyListeners();
  }
}

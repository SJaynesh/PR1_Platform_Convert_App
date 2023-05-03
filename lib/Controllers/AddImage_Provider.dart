import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platform_convert_app_code/Models/AddImage_Model.dart';
import 'package:platform_convert_app_code/utills/All_Atributes.dart';

class AddImage_Provider extends ChangeNotifier {
  AddImage_Model a1 = AddImage_Model(image: File(""));

  putImageForCamera() async {
    ImagePicker picker = ImagePicker();

    XFile? xFile = await picker.pickImage(source: ImageSource.camera);

    String path = xFile!.path;

    a1.image = File(path);

    allImages = a1.image.path;

    notifyListeners();
  }

  putImageForGallery() async {
    ImagePicker picker = ImagePicker();

    XFile? xFile = await picker.pickImage(source: ImageSource.gallery);

    String path = xFile!.path;

    a1.image = File(path);

    allImages = a1.image.path;

    notifyListeners();
  }

  ClearImage() {
    a1.image = File("");
    notifyListeners();
  }
}

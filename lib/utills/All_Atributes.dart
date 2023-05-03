import 'package:flutter/material.dart';

String imagePath = "assets/images/";

int pageViewIndex = 0;

PageController pageController = PageController();

String? Name;
String? Bio;

TextEditingController FullNameController = TextEditingController();
TextEditingController PhoneNumberController = TextEditingController();
TextEditingController ChatController = TextEditingController();

String? fullName;
String? phoneNumber;
String? chat;

DateTime Date = DateTime.now();
DateTime? PickedDate;

TimeOfDay? time;
TimeOfDay Time = TimeOfDay.now();

DateTime InitialTime = DateTime.now();
String? PeriodName;

List<String> FullName = [];
List<String> PhoneNumber = [];
List<String> Chats = [];
List<String> Dates = [];
List<String> Months = [];
List<String> Years = [];
List<String> Hours = [];
List<String> Minits = [];
List<String> Images = [];

String allImages = "";

String? fullNameEdit;
String? phoneNumberEdit;
String? chatEdit;

DateTime? PickedDateEdit;
TimeOfDay TimeEdit = TimeOfDay.now();

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:helloworld/Hienthisanpham.dart';
import 'package:helloworld/LoginScreen.dart';
import 'package:helloworld/MyHttpOverrides.dart';
import 'package:helloworld/Home.dart';
import 'FigmaToCodeApp.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();

  //runApp(MaterialApp(debugShowCheckedModeBanner: false, home: LoginScreen()));
  //
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MainScreen()));
  //
  //runApp(FigmaToCodeApp());
}

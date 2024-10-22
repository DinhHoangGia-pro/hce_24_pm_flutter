import 'dart:io';

import 'package:flutter/material.dart';
import 'package:helloworld/Hienthisanpham.dart';
import 'package:helloworld/MyHttpOverrides.dart';
import 'package:helloworld/Home.dart';

void main() {
  HttpOverrides.global = new MyHttpOverrides();

  runApp(Home());
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:helloworld/Hienthisanpham.dart';
import 'package:helloworld/MyHttpOverrides.dart';

void main() {
  HttpOverrides.global = new MyHttpOverrides();

  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
          child: Scaffold(
              appBar: AppBar(
                  title: Image.network(
                      'https://img.freepik.com/premium-vector/ho-chi-minh-city-vietnam-skyline-with-panorama-white-background-vector-illustration-business-travel-tourism-concept-with-modern-buildings-image-banner-web-site_596401-63.jpg?w=1060')),
              body: Hienthisanpham()))));
}

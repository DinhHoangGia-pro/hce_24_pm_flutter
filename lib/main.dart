import 'dart:io';

import 'package:flutter/material.dart';
import 'package:helloworld/ButtonSeletionWidget.dart';
import 'package:helloworld/MyHttpOverrides.dart';
import 'package:helloworld/MyPlusWidget.dart';
import 'package:helloworld/MyStatePlusWidget.dart';

TextEditingController txt1_controller = TextEditingController();
TextEditingController txt2_controller = TextEditingController();
TextEditingController kq_controller = TextEditingController();

void main() {
  HttpOverrides.global = new MyHttpOverrides();

  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
          child: Scaffold(
              appBar: AppBar(
                  title: Image.network(
                      'https://img.freepik.com/premium-vector/ho-chi-minh-city-vietnam-skyline-with-panorama-white-background-vector-illustration-business-travel-tourism-concept-with-modern-buildings-image-banner-web-site_596401-63.jpg?w=1060')),
              body: Column(
                children: [
                  ButtonSection(),
                  MyPlusWidget(),
                  ButtonWithText(
                      color: Colors.blueAccent,
                      icon: Icons.access_alarm_rounded,
                      label: 'Xin chao HCE'),
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    transform: Matrix4.rotationZ(0.02),
                    decoration: BoxDecoration(
                        color: Color(0xff6a9abf),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: MyStatePlusWidget(),
                  ),
                ],
              )))));
}

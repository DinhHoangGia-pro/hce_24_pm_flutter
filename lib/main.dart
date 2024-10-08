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

  final List<String> dssanpham = <String>[
    'Sản phẩm 1',
    'Sản phẩm 2',
    'Sản phẩm 3',
    'Sản phẩm 4',
    'Sản phẩm 5',
    'Sản phẩm 6',
    'Sản phẩm 7',
    'Sản phẩm 8',
    'Sản phẩm 9',
    'Sản phẩm 10',
    'Sản phẩm 11',
    'Sản phẩm 12',
    'Sản phẩm 13',
    'Sản phẩm 14',
    'Sản phẩm 15',
  ];

  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
          child: Scaffold(
              appBar: AppBar(
                  title: Image.network(
                      'https://img.freepik.com/premium-vector/ho-chi-minh-city-vietnam-skyline-with-panorama-white-background-vector-illustration-business-travel-tourism-concept-with-modern-buildings-image-banner-web-site_596401-63.jpg?w=1060')),
              body: Container(
                  margin: EdgeInsets.all(10.0),
                  transform: Matrix4.rotationZ(0.03),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Color(0xff6f82d0)),
                  child: ListView.builder(
                      itemCount: dssanpham.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 50,
                          child: Text(
                              'Ten san phảm:' + dssanpham[index].toString()),
                        );
                      }))))));
}

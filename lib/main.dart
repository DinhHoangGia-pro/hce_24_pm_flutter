import 'dart:io';

import 'package:flutter/material.dart';
import 'package:helloworld/ButtonSeletionWidget.dart';
import 'package:helloworld/MyHttpOverrides.dart';
import 'package:helloworld/MyPlusWidget.dart';
import 'package:helloworld/MyStatePlusWidget.dart';
import 'package:helloworld/models/Product.dart';

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
              body: Container(
                  margin: EdgeInsets.all(10.0),
                  transform: Matrix4.rotationZ(0.02),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Color(0x85fd2408)),
                  child: ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                            height: 200,
                            child: Container(
                                height: 200,
                                color: Color(0xffd5e0e8),
                                child: Column(
                                  children: [
                                    Expanded(
                                        child: Image.asset(
                                            products[index].image.toString())),
                                    Text(products[index].title.toString()),
                                  ],
                                )));
                      }))))));
}

import 'package:flutter/material.dart';
import 'package:helloworld/models/Product.dart';

class ProductDetails extends StatefulWidget {
  Product product;

  ProductDetails({Key? key, required this.product}) : super(key: key);

  //Hienthisanpham();

  @override
  ProductState createState() => ProductState();
}

//------------------------------
//
class ProductState extends State<ProductDetails> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Day la trang Detail"),
    );
  }
}

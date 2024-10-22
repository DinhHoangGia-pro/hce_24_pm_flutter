import 'package:flutter/material.dart';
import 'package:helloworld/ProductDetails.dart';
import 'package:helloworld/models/Product.dart';

class Hienthisanpham extends StatefulWidget {
  //List<Product> _lstproducts;

  //Hienthisanpham();

  @override
  ListProductState createState() => ListProductState();
}

//------------------------------
//
class ListProductState extends State<Hienthisanpham> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("O tim kiem")),
        body: Container(
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Color(0xff7f98e7),
            ),
            child: GridView.builder(
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Số cột là 2
                  childAspectRatio: 0.75, // Tỷ lệ chiều cao / chiều rộng
                  crossAxisSpacing: 10.0, // Khoảng cách giữa các cột
                  mainAxisSpacing: 10.0, // Khoảng cách giữa các hàng
                ),
                itemBuilder: (BuildContext context, int index) {
                  return
                      //Text(products[index].title.toString());
                      Card(
                          color: Color(0xfff1cee6),
                          child: Column(
                            children: [
                              Expanded(
                                  child: Container(
                                      padding: EdgeInsets.all(5.0),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: GestureDetector(
                                          onTap: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      ProductDetails(
                                                          product: products[
                                                              index]))),
                                          child: Image.asset(
                                            products[index].image.toString(),
                                            fit: BoxFit.cover,
                                          )))),
                              ListTile(
                                title: Text(
                                  products[index].title.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow
                                      .ellipsis, // Cắt bớt text nếu quá dài
                                ),
                                subtitle: Text(
                                  "\$${products[index].price.toString()}",
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                trailing: Icon(Icons
                                    .shopping_cart_outlined), // Biểu tượng giỏ hàng
                              ),
                            ],
                          ));
                })));
  }
}

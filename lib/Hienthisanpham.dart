import 'package:flutter/material.dart';
import 'package:helloworld/ProductDetails.dart';
import 'package:helloworld/models/Product.dart';

class Hienthisanpham extends StatefulWidget {
  List<Product> _lstproducts = products;

  //Hienthisanpham();

  @override
  ListProductState createState() => ListProductState();
}

//------------------------------
//
class ListProductState extends State<Hienthisanpham> {
  // Bộ điều khiển TextField để tìm kiếm
  TextEditingController searchController = TextEditingController();
  List<Product> lstproducts = products;

  // Hàm lọc sản phẩm dựa vào tiêu đề
  void filterProducts(String query) {
    List<Product> filteredList = products.where((phantu) {
      return phantu.title?.toLowerCase().contains(query.toLowerCase()) ?? false;
    }).toList();

    setState(() {
      lstproducts = filteredList;
    });
  }

  @override
  void initState() {
    super.initState();
    lstproducts = widget._lstproducts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Products'),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: searchController,
                onChanged: (value) {
                  // Gọi hàm filter khi thay đổi giá trị trong ô tìm kiếm
                  filterProducts(value);
                },
                decoration: InputDecoration(
                  hintText: 'Tìm kiếm sản phẩm...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
          ),
        ),
        body: Container(
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Color(0xff7f98e7),
            ),
            child: GridView.builder(
                itemCount: lstproducts.length,
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
                                                          product: lstproducts[
                                                              index]))),
                                          child: Image.asset(
                                            lstproducts[index].image.toString(),
                                            fit: BoxFit.cover,
                                          )))),
                              ListTile(
                                title: Text(
                                  lstproducts[index].title.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow
                                      .ellipsis, // Cắt bớt text nếu quá dài
                                ),
                                subtitle: Text(
                                  "\$${lstproducts[index].price.toString()}",
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

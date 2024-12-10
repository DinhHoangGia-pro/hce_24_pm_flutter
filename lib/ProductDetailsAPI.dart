import 'package:flutter/material.dart';
import 'models/Product.dart';
import 'models/Cart.dart';
import 'package:http/http.dart' as http; /*Thư viện kết nối backend*/
import 'dart:convert'; /*Xử lý json */
import "dart:convert" show utf8;
import 'ProductForm.dart';
import 'Global.dart';

class ProductDetailsAPI extends StatefulWidget {
  Product product;

  ProductDetailsAPI({Key? key, required this.product}) : super(key: key);

  //Hienthisanpham();

  @override
  ProductDetailsAPIState createState() => ProductDetailsAPIState();
}

class ProductDetailsAPIState extends State<ProductDetailsAPI> {
  Product product = Product(image: '', title: '', description: '', size: 0);

  late Future<List<Product>> lstsanphamlienquan;

  Future<List<Product>> Laydulieutubackend() async {
    final response = await http.get(Uri.parse(
        Global.URL_products + '?category=' + product.category.toString()));

    if (response.statusCode == 200) {
      // Chuyển đổi JSON sang danh sách các đối tượng Product

      List<dynamic> jsonData = json.decode(response.body);

      return jsonData.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception('Không đọc được sản phẩm từ backend');
    }
  }

  @override
  void initState() {
    super.initState();
    product = widget.product;
    lstsanphamlienquan = Laydulieutubackend();
  }

  String vifont(String str) {
    String str1 = str ?? '';

    return utf8.decode(str1.runes.toList());
  }

  void _deleteProduct() async {
    final response = await http.delete(
      Uri.parse(Global.URL_products + '/${widget.product.id}'),
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Xóa sản phẩm thành công')));
      Navigator.pop(context); // Close the details page
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Xóa sản phẩm thất bại')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title ?? "No Title"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*Them cac button Them/Sua/Xoa*/

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductForm(
                            onSubmit: (product) async {
                              try {
                                final response = await http.post(
                                  Uri.parse(Global.URL_products),
                                  headers: {'Content-Type': 'application/json'},
                                  body: jsonEncode({
                                    'title': product.title,
                                    'price': product.price,
                                    'description': product.description,
                                    'image': product.image,
                                    'category': product.category,
                                  }),
                                );
                                if (response.statusCode == 200 ||
                                    response.statusCode == 201) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                            Text('Thêm sản phẩm thành công')),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            'Thêm sản phẩm thất bại: ${response.body}')),
                                  );
                                }
                              } catch (err) {
                                print("Lỗi xảy ra:" + err.toString());
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Lỗi: $err')),
                                );
                              }
                            },
                          ),
                        ),
                      );
                    },
                    child: Text('Thêm'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductForm(
                            product: widget.product,
                            onSubmit: (product) async {
                              try {
                                final response = await http.put(
                                  Uri.parse(Global.URL_products +
                                      '/' +
                                      product.id.toString()),
                                  headers: {'Content-Type': 'application/json'},
                                  body: jsonEncode({
                                    'title': product.title,
                                    'price': product.price,
                                    'description': product.description,
                                    'image': product.image,
                                    'category': product.category,
                                  }),
                                );
                                if (response.statusCode == 200) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            'Cập nhật sản phẩm thành công')),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            'Cập nhật thất bại: ${response.body}')),
                                  );
                                }
                              } catch (error) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Lỗi: $error')),
                                );
                              }
                            },
                          ),
                        ),
                      );
                    },
                    child: Text('Sửa'),
                  ),
                  ElevatedButton(
                    onPressed: _deleteProduct,
                    child: Text('Xóa'),
                  ),
                ],
              ),

              /*Het phan button Them/Sua/Xoa*/

              SizedBox(height: 20),

              Center(
                child: Hero(
                  tag: product.id,
                  child: Image.network(
                    product.image ?? 'assets/default_image.png',
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                Global.vifont(product.title.toString()) ?? "No Title",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "\$${product.price.toStringAsFixed(2)}",
                style: TextStyle(fontSize: 20, color: Colors.green),
              ),
              SizedBox(height: 20),
              Text(
                "Mô Tả:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                Global.vifont(product.description.toString()),
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 30),
              Text(
                "Sản Phẩm Liên Quan:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              // Hiển thị sản phẩm liên quan
              Container(
                  height:
                      200, // Đặt chiều cao cho danh sách các sản phẩm liên quan
                  child: FutureBuilder<List<Product>>(
                    future: lstsanphamlienquan,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text('Lỗi:' + snapshot.error.toString()),
                        );
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Center(
                          child: Text('Không có dữ liệu'),
                        );
                      } else {
                        List<Product> lst = snapshot.data!;
                        return Center(
                          child:

                              //Trình bay san pham lien quan
                              ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: lst.length,
                            itemBuilder: (BuildContext context, int index) {
                              Product relatedProduct = lst[index];
                              return GestureDetector(
                                onTap: () {
                                  // Điều hướng sang trang chi tiết sản phẩm khi nhấn vào sản phẩm liên quan
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductDetailsAPI(
                                          product: relatedProduct),
                                    ),
                                  );
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  width: 150,
                                  decoration: BoxDecoration(
                                    color: const Color(0xffebf0f2),
                                    borderRadius: BorderRadius.circular(15.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(15.0)),
                                          child: Image.network(
                                            relatedProduct.image ??
                                                'assets/default_image.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          vifont(
                                              relatedProduct.title.toString()),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }
                    },
                  )),

              SizedBox(height: 20),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Thêm sản phẩm vào giỏ hàng
                    Cart.addToCart(product);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${product.title} added to cart!'),
                      ),
                    );
                  },
                  icon: Icon(Icons.add_shopping_cart),
                  label: Text("Add to Cart"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff2196f3),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    textStyle: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

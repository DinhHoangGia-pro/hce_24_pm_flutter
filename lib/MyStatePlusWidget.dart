import 'package:flutter/material.dart';

class MyStatePlusWidget extends StatefulWidget {
  int ketqua = 0;
  @override
  State<StatefulWidget> createState() => MyState();
}

class MyState extends State<MyStatePlusWidget> {
  int kq = 0;
  TextEditingController txt1_controller = TextEditingController();
  TextEditingController txt2_controller = TextEditingController();

  void cong2so() {
    final sothu1 = txt1_controller.text;
    final sothu2 = txt2_controller.text;
    int c = 0;

    try {
      int a = int.parse(sothu1);
      int b = int.parse(sothu2);
      c = a + b;
    } on Exception catch (e) {}

    setState(() {
      kq = c;
    });
  }

  @override
  void initState() {
    kq = widget.ketqua;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (Column(
      children: [
        TextField(
          controller: txt1_controller,
          decoration: InputDecoration(hintText: "Số thứ nhất"),
        ),
        TextField(
          controller: txt2_controller,
          decoration: InputDecoration(hintText: "Số thứ hai"),
        ),
        ElevatedButton(onPressed: cong2so, child: Text("Cộng hai số")),
        Text(kq.toString(),
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange))
      ],
    ));
  }
}

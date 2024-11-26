import 'package:flutter/material.dart';

class MyPlusWidget extends StatelessWidget {
  TextEditingController txt1_controller = TextEditingController();
  TextEditingController txt2_controller = TextEditingController();
  TextEditingController kq_controller = TextEditingController();

  void cong2so() {
    final sothu1 = txt1_controller.text;
    final sothu2 = txt2_controller.text;

    try {
      int a = int.parse(sothu1);
      int b = int.parse(sothu2);
      int c = a + b;
      kq_controller.text = c.toString();
    } on Exception catch (e) {
      kq_controller.text = "Lỗi:" + e.toString();
    }
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
        TextField(
          controller: kq_controller,
          decoration: InputDecoration(hintText: "ket qua"),
        ),
      ],
    ));
  }
}

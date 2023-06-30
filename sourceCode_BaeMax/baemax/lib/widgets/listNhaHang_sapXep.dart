import 'package:flutter/material.dart';

class sapXepListNhaHang extends StatefulWidget {
  sapXepListNhaHang({super.key});

  @override
  State<sapXepListNhaHang> createState() => _sapXepListNhaHangState();
}

class _sapXepListNhaHangState extends State<sapXepListNhaHang> {
  String? sort;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        centerTitle: true,
        title: const Text(
          'Sắp xếp',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
          size: 30,
        ),
      ),
      body: Container(
        child: Column(
          children: [
            RadioListTile(
              title: const Text(
                'Gần nhất',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              value: 'gannhat',
              groupValue: sort,
              controlAffinity: ListTileControlAffinity.trailing,
              onChanged: (value) {
                setState(() {
                  sort = value.toString();
                  print(sort);
                });
              },
            ),
            RadioListTile(
              title: const Text(
                'Đánh giá tốt',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              value: 'danhgiatot',
              groupValue: sort,
              controlAffinity: ListTileControlAffinity.trailing,
              onChanged: (value) {
                setState(() {
                  sort = value.toString();
                  print(sort);
                });
              },
            ),
            RadioListTile(
              title: const Text(
                'Phổ biến',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              value: 'phobien',
              groupValue: sort,
              controlAffinity: ListTileControlAffinity.trailing,
              onChanged: (value) {
                setState(() {
                  sort = value.toString();
                  print(sort);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

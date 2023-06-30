import 'package:flutter/material.dart';

class danhMucVaCuaHangListNhaHang extends StatefulWidget {
  danhMucVaCuaHangListNhaHang({super.key});

  @override
  State<danhMucVaCuaHangListNhaHang> createState() =>
      _danhMucVaCuaHangListNhaHangState();
}

class _danhMucVaCuaHangListNhaHangState
    extends State<danhMucVaCuaHangListNhaHang> {
  String? chonCuaHang;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        centerTitle: true,
        title: const Text(
          'Danh mục & cửa hàng',
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
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black, width: 1),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Cửa hàng',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  RadioListTile(
                    title: const Text(
                      'Mart',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    value: 'mart',
                    groupValue: chonCuaHang,
                    controlAffinity: ListTileControlAffinity.trailing,
                    onChanged: (value) {
                      setState(() {
                        chonCuaHang = value.toString();
                        print(chonCuaHang);
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text(
                      'BAEMAX Kitchen',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    value: 'baemaxkitchen',
                    controlAffinity: ListTileControlAffinity.trailing,
                    groupValue: chonCuaHang,
                    onChanged: (value) {
                      setState(() {
                        chonCuaHang = value.toString();
                        print(chonCuaHang);
                      });
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

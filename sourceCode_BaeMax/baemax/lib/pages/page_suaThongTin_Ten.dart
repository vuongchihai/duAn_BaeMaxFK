import 'package:flutter/material.dart';

class suaThongTin_Ten_Page extends StatefulWidget {
  const suaThongTin_Ten_Page({super.key});

  @override
  State<suaThongTin_Ten_Page> createState() => _suaThongTin_Ten_PageState();
}

class _suaThongTin_Ten_PageState extends State<suaThongTin_Ten_Page> {
  String ten = 'Vương Chí Hải';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.5,
        title: const Text(
          'Thay đổi tên',
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
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.close,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 13,
          vertical: 25,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Tên',
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: ten,
                hintStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
              onChanged: (value) {
                setState(
                  () {
                    ten = value.isEmpty ? '' : value;
                  },
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ten.isEmpty
                ? const Text(
                    'Tên không hợp lệ, vui lòng kiểm tra lại',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.red,
                    ),
                  )
                : SizedBox(),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: ten.isEmpty
                        ? null
                        : () {
                            print('da lcik ne');
                          },
                    child: const Text(
                      'Lưu',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

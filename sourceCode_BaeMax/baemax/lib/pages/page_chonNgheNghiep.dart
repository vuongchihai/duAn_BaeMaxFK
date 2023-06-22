import 'package:flutter/material.dart';

class chonNgheNghiepPage extends StatefulWidget {
  const chonNgheNghiepPage({super.key});

  @override
  State<chonNgheNghiepPage> createState() => _chonNgheNghiepPageState();
}

class _chonNgheNghiepPageState extends State<chonNgheNghiepPage> {
  int ngheNghiepDuocChon = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          'Nghề nghiệp',
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
          icon: const Icon(Icons.close),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 13,
          vertical: 25,
        ),
        child: Column(
          children: [
            const Text(
              'Giúp BAEMAX có thể gợi ý các món ăn phù hợp cho bạn',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  ngheNghiepDuocChon = 0;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Image(
                    image: AssetImage(
                      'images/hinh_58.png',
                    ),
                    width: 40,
                    height: 40,
                  ),
                  SizedBox(
                    width: 10,
                    height: 25,
                    child: Container(
                      color: Colors.transparent,
                    ),
                  ),
                  const Text(
                    'Nhân viên văn phòng',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 90,
                    height: 25,
                    child: Container(
                      color: Colors.transparent,
                    ),
                  ),
                  Icon(
                    Icons.check,
                    color: ngheNghiepDuocChon == 0
                        ? Colors.blue
                        : Colors.transparent,
                    size: 35,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  ngheNghiepDuocChon = 1;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Image(
                    image: AssetImage(
                      'images/hinh_59.png',
                    ),
                    width: 40,
                    height: 40,
                  ),
                  SizedBox(
                    width: 10,
                    height: 25,
                    child: Container(
                      color: Colors.transparent,
                    ),
                  ),
                  const Text(
                    'Nội trợ',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 210,
                    height: 25,
                    child: Container(
                      color: Colors.transparent,
                    ),
                  ),
                  Icon(
                    Icons.check,
                    color: ngheNghiepDuocChon == 1
                        ? Colors.blue
                        : Colors.transparent,
                    size: 35,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  ngheNghiepDuocChon = 2;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Image(
                    image: AssetImage(
                      'images/hinh_60.png',
                    ),
                    width: 40,
                    height: 40,
                  ),
                  SizedBox(
                    width: 10,
                    height: 25,
                    child: Container(
                      color: Colors.transparent,
                    ),
                  ),
                  const Text(
                    'Học sinh, sinh viên',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 110,
                    height: 25,
                    child: Container(
                      color: Colors.transparent,
                    ),
                  ),
                  Icon(
                    Icons.check,
                    color: ngheNghiepDuocChon == 2
                        ? Colors.blue
                        : Colors.transparent,
                    size: 35,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  ngheNghiepDuocChon = 3;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Image(
                    image: AssetImage(
                      'images/hinh_61.png',
                    ),
                    width: 40,
                    height: 40,
                  ),
                  SizedBox(
                    width: 10,
                    height: 25,
                    child: Container(
                      color: Colors.transparent,
                    ),
                  ),
                  const Text(
                    'Làm tự do',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 190,
                    height: 25,
                    child: Container(
                      color: Colors.transparent,
                    ),
                  ),
                  Icon(
                    Icons.check,
                    color: ngheNghiepDuocChon == 3
                        ? Colors.blue
                        : Colors.transparent,
                    size: 35,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  ngheNghiepDuocChon = 4;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Image(
                    image: AssetImage(
                      'images/hinh_62.png',
                    ),
                    width: 40,
                    height: 40,
                  ),
                  SizedBox(
                    width: 10,
                    height: 25,
                    child: Container(
                      color: Colors.transparent,
                    ),
                  ),
                  const Text(
                    'Công nhân',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 180,
                    height: 25,
                    child: Container(
                      color: Colors.transparent,
                    ),
                  ),
                  Icon(
                    Icons.check,
                    color: ngheNghiepDuocChon == 4
                        ? Colors.blue
                        : Colors.transparent,
                    size: 35,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  ngheNghiepDuocChon = 5;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Image(
                    image: AssetImage(
                      'images/hinh_63.png',
                    ),
                    width: 40,
                    height: 40,
                  ),
                  SizedBox(
                    width: 10,
                    height: 25,
                    child: Container(
                      color: Colors.transparent,
                    ),
                  ),
                  const Text(
                    'Khác',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 230,
                    height: 25,
                    child: Container(
                      color: Colors.transparent,
                    ),
                  ),
                  Icon(
                    Icons.check,
                    color: ngheNghiepDuocChon == 5
                        ? Colors.blue
                        : Colors.transparent,
                    size: 35,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: ngheNghiepDuocChon == -1 ? null : () {},
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

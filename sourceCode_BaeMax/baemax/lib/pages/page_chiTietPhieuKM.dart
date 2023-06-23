import 'package:flutter/material.dart';

class thongTinChiTietPhieuKMPage extends StatefulWidget {
  thongTinChiTietPhieuKMPage({super.key});

  @override
  State<thongTinChiTietPhieuKMPage> createState() =>
      _thongTinChiTietPhieuKMPageState();
}

class _thongTinChiTietPhieuKMPageState
    extends State<thongTinChiTietPhieuKMPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Cho phép body hiển thị phía sau AppBar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          size: 30,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                  ),
                ),
              ),
              child: Stack(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Container(
                          color: Colors.amber,
                          width: double.infinity,
                          height: 300,
                          padding: const EdgeInsets.only(
                            top: 90,
                          ),
                          child: const Image(
                            image: AssetImage('images/hinh_53.png'),
                          ),
                        ),
                        Container(
                          height: 150,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 250,
                    left: 10.0,
                    right: 10.0,
                    child: Container(
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xffDDDDDD),
                            blurRadius: 8,
                            spreadRadius: 2,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 15,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue,
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 3,
                              vertical: 3,
                            ),
                            child: Text(
                              'QUANMOIKHAOSG15',
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Quán mới khao Freeship 15K cho đơn từ 30K',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text.rich(
                            TextSpan(
                              text: 'Sử dụng để: ',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey,
                              ),
                              children: [
                                TextSpan(
                                  text: '23.06.2023',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromARGB(
                                        255, 110, 109, 109),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Coupong giảm 1500đ cho đơn từ 30000đ',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Coupong giảm 1500đ cho đơn từ 30000đ',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Coupong giảm 1500đ cho đơn từ 30000đ',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Coupong giảm 1500đ cho đơn từ 30000đ',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Coupong giảm 1500đ cho đơn từ 30000đ',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Coupong giảm 1500đ cho đơn từ 30000đ',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Coupong giảm 1500đ cho đơn từ 30000đ',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Coupong giảm 1500đ cho đơn từ 30000đ',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Coupong giảm 1500đ cho đơn từ 30000đ',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Coupong giảm 1500đ cho đơn từ 30000đ',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

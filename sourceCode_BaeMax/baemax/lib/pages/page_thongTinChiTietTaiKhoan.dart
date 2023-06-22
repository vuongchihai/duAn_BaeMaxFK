import 'package:baemax/pages/page_chonGioiTinh.dart';
import 'package:baemax/pages/page_chonNgaySinh.dart';
import 'package:baemax/pages/page_chonNgheNghiep.dart';
import 'package:baemax/pages/page_suaThongTin_SDT.dart';
import 'package:baemax/pages/page_suaThongTin_Ten.dart';
import 'package:baemax/pages/page_thayDoiMatKhau.dart';
import 'package:flutter/material.dart';

import 'page_thayDoiEmail.dart';
import 'page_xoaTaiKhoan.dart';

class thongTinChiTietTaiKhoanPage extends StatelessWidget {
  const thongTinChiTietTaiKhoanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Thông tin tài khoản',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: const Color(0xffF8F8FF),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 13,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 90,
                          height: 90,
                          margin: const EdgeInsets.symmetric(
                            vertical: 20,
                          ),
                          child: LayoutBuilder(
                            builder: (BuildContext context,
                                BoxConstraints constraints) {
                              return Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    width: constraints.maxWidth,
                                    height: constraints.maxHeight,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  //AspectRatio: điều chỉnh tỷ lệ khung hình
                                  const AspectRatio(
                                    // aspectRatio: 1.0,
                                    // -> thuộc tính aspectRation: 1.0
                                    // thiết lập tỷ lệ giữa chiều rộng và chiều cao của widget con(tính bằng cách chia chiều rộng cho chiều cao)
                                    aspectRatio: 1.0,
                                    child: Image(
                                      image: AssetImage('images/hinh_34.png'),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Tên',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Vương Chí Hải',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => suaThongTin_Ten_Page(),
                              ),
                            );
                          },
                          child: const Image(
                            image: AssetImage('images/hinh_32.png'),
                            fit: BoxFit.cover,
                            width: 25,
                            height: 25,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Container(
                      width: double.infinity, // Độ dài đường thẳng
                      child: const Divider(
                        color: Colors.black, // Màu sắc của đường thẳng
                        thickness: 1.0, // Độ dày của đường thẳng
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Số điện thoại',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '0949162193',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => suaThongTin_SDT_Page(),
                              ),
                            );
                          },
                          child: const Image(
                            image: AssetImage('images/hinh_32.png'),
                            fit: BoxFit.cover,
                            width: 25,
                            height: 25,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Container(
                      width: double.infinity, // Độ dài đường thẳng
                      child: const Divider(
                        color: Colors.black, // Màu sắc của đường thẳng
                        thickness: 1.0, // Độ dày của đường thẳng
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Địa chỉ Email',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'vuongchihai0711@gmail.com',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => thayDoiEmailPage(),
                              ),
                            );
                          },
                          child: const Image(
                            image: AssetImage('images/hinh_32.png'),
                            fit: BoxFit.cover,
                            width: 25,
                            height: 25,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Container(
                      width: double.infinity, // Độ dài đường thẳng
                      child: const Divider(
                        color: Colors.black, // Màu sắc của đường thẳng
                        thickness: 1.0, // Độ dày của đường thẳng
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Giới tính',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '-Chọn-',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => chonGioiTinhPage(),
                              ),
                            );
                          },
                          child: const Image(
                            image: AssetImage('images/hinh_32.png'),
                            fit: BoxFit.cover,
                            width: 25,
                            height: 25,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Ngày sinh',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'DD/MM/YYYY',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => chonNgaySinhPage(),
                              ),
                            );
                          },
                          child: const Image(
                            image: AssetImage('images/hinh_32.png'),
                            fit: BoxFit.cover,
                            width: 25,
                            height: 25,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Container(
                      width: double.infinity, // Độ dài đường thẳng
                      child: const Divider(
                        color: Colors.black, // Màu sắc của đường thẳng
                        thickness: 1.0, // Độ dày của đường thẳng
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nghề nghiệp',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '-Chọn-',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => chonNgheNghiepPage(),
                              ),
                            );
                          },
                          child: const Image(
                            image: AssetImage('images/hinh_32.png'),
                            fit: BoxFit.cover,
                            width: 25,
                            height: 25,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 13,
                  vertical: 10,
                ),
                child: const Text(
                  '* Các thông tin này sẽ không được hiển thị hoặc chia sẻ cho bất kì ai khác ngoài bạn cả.',
                  style: TextStyle(
                    fontSize: 17.5,
                    color: Color.fromARGB(255, 96, 92, 92),
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 13,
                  vertical: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Đổi mật khẩu',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => doiMatKhauPage(),
                              ),
                            );
                      },
                      child: const Text(
                        '>',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 13,
                  vertical: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Xóa Tài Khoản',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => xoaTaiKhoanPage(),
                              ),
                            );
                      },
                      child: const Text(
                        '>',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 13,
                  vertical: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        print('da click');
                      },
                      child: const Text(
                        'Thoát ra',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

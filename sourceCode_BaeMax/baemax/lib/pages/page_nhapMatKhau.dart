import 'package:baemax/models/khachHang.dart';
import 'package:baemax/pages/page_thongTinTaiKhoan.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../models/User.dart';

class nhapMatKhauPage extends StatefulWidget {
  final String sdtVuaNhap;
  nhapMatKhauPage({Key? key, required this.sdtVuaNhap}) : super(key: key);

  @override
  State<nhapMatKhauPage> createState() => _nhapMatKhauPageState();
}

class _nhapMatKhauPageState extends State<nhapMatKhauPage> {
  String sdtVuaNhap = '';
  bool anHoacHienMatKhau = true;
  final TextEditingController matKhauController = TextEditingController();
  bool trangThaiDangNhap = false;

  void dangNhap(BuildContext context) async {
    final String phoneNumber = sdtVuaNhap;
    final String password = matKhauController.text;

    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('khachHang')
        .where('sdt', isEqualTo: phoneNumber)
        .where('matKhau', isEqualTo: password)
        .limit(1)
        .get();

    if (snapshot.size > 0) {
      final customer = KhachHang.fromSnapshot(snapshot.docs[0]);
      final user = Provider.of<User>(context, listen: false);
      user.updateInfo(customer.sdt, customer.matKhau);
      Navigator.push(context, MaterialPageRoute(builder: (context) => thongTinTaiKhoanPage(
        fromLogin: true,
      )));
    } else {
      setState(() {
        trangThaiDangNhap = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    sdtVuaNhap = widget.sdtVuaNhap;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 13,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Nhập mật khẩu',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Số điện thoại dùng đăng ký là $sdtVuaNhap',
              style: const TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 96, 92, 92),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue,
                  // color: kiemTraSDTTrungNhau(SDTHienTai, SDTMoi)
                  //     ? Colors.red
                  //     : Colors.blue,
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 290,
                    child: TextField(
                      controller: matKhauController,
                      obscureText: anHoacHienMatKhau ? true : false,
                      decoration: const InputDecoration(
                        hintText: 'Mật khẩu',
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                      onChanged: (value) {
                        setState(() {
                          // SDTMoi = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        anHoacHienMatKhau = !anHoacHienMatKhau;
                      });
                    },
                    child: const Text(
                      'HIỆN',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            trangThaiDangNhap
                ? const Text(
                    'Mật khẩu của bạn không chính xác',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 18,
                    ),
                  )
                : SizedBox(),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {
                print('object');
              },
              child: const Text(
                'Bạn quên mật khẩu ư?',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: matKhauController.text.isEmpty
                        ? null
                        : () async {
                            dangNhap(context);
                          },
                    child: const Text(
                      'Đăng nhập',
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

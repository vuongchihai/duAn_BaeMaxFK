import 'package:flutter/material.dart';

class nhapMatKhauPage extends StatefulWidget {
  final String sdtVuaNhap;
  nhapMatKhauPage({Key? key, required this.sdtVuaNhap}) : super(key: key);

  @override
  State<nhapMatKhauPage> createState() => _nhapMatKhauPageState();
}

class _nhapMatKhauPageState extends State<nhapMatKhauPage> {
  String SDTHienTai = '0949162193';
  String SDTMoi = '';
  bool anHoacHienMatKhau = true;

  bool kiemTraSDTTrungNhau(String sdtHienTai, String sdtMoi) {
    return sdtHienTai == sdtMoi;
  }

  @override
  void initState(){
    super.initState();
    SDTMoi = widget.sdtVuaNhap;
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
              'Số điện thoại dùng đăng ký là ${SDTMoi}',
              style:const  TextStyle(
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
                  color: kiemTraSDTTrungNhau(SDTHienTai, SDTMoi)
                      ? Colors.red
                      : Colors.blue,
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
                          SDTMoi = value;
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
            kiemTraSDTTrungNhau(SDTHienTai, SDTMoi)
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
                    onPressed: SDTMoi.isEmpty
                        ? null
                        : () {
                            print('object');
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

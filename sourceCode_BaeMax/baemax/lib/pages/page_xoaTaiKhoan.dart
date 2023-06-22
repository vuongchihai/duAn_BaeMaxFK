import 'package:flutter/material.dart';

class xoaTaiKhoanPage extends StatelessWidget {
  const xoaTaiKhoanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 221, 217, 217),
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 180,
              color: Color.fromARGB(255, 221, 217, 217),
              child: const Image(
                image: AssetImage('images/hinh_70.png'),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Ủa tính nghỉ chơi BAEMAX thiệt hả?',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    'Lưu ý: Tài khoản sau khi xóa sẽ không thể phục hồi lại được.',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  RichText(
                    text: const TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              'Bạn sẽ mất tất cả thông tin và ưu đãi cá nhân bao gồm ',
                          style: TextStyle(
                            color: Color.fromARGB(255, 98, 98, 98),
                            fontSize: 20,
                          ),
                        ),
                        TextSpan(
                          text:
                              'coupon, lợi ích từ BESTBAE, nhà hàng yêu thích, nhận xét, đơn hàng và địa chỉ đã lưu.',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  RichText(
                    text: const TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              'Sau khi xóa tài khoản, bạn sẽ ',
                          style: TextStyle(
                            color: Color.fromARGB(255, 98, 98, 98),
                            fontSize: 20,
                          ),
                        ),
                        TextSpan(
                          text:
                              'không thể dùng lại email và số điện thoại của tài khoản này để tạo tài khoản mới luôn nha bạn yêu.',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    'Bộ phận CSKH của BAEMAX sẽ không thể hỗ trợ bạn phục hồi tài khoản.',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Thôi không xóa nữa',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                      onPressed: () {
                        print('object');
                      },
                      child: const Text(
                        'Xóa tài khoản này',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
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

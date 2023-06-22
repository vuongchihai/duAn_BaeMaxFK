import 'package:flutter/material.dart';

import '../pages/page_hopThu.dart';
import '../pages/page_thongTinTaiKhoan.dart';

class main_header_widget extends StatelessWidget {
  const main_header_widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () {},
            child: const Row(
              children: [
                Image(
                  image: AssetImage('images/hinh_20.png'),
                  width: 20,
                  height: 20,
                ),
                Text(
                  'ktx >',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => hopThuPage(),
                      ),
                    );
                  },
                  child: const Image(
                    image: AssetImage('images/hinh_19.png'),
                    width: 20,
                    height: 20,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => thongTinTaiKhoanPage(),
                      ),
                    );
                  },
                  child: const Image(
                    image: AssetImage('images/hinh_35.png'),
                    width: 20,
                    height: 20,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

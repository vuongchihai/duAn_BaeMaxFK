import 'package:baemax/models/MonAn.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';

import '../pages/page_hopThu.dart';
import '../pages/page_thongTinTaiKhoan.dart';

class main_header_widget extends StatelessWidget {
  const main_header_widget({
    super.key,
  });

  void themMonAnVaoNhaHang(MonAn monAn, String idNhaHang) {
    FirebaseFirestore.instance
        .collection('nhaHang')
        .doc('NH01')
        .collection('monAn')
        .add({
      'IDMonAn': monAn.IDMonAn,
      'tenMon': monAn.tenMon,
      'hinhAnhMA': monAn.hinhAnhMA,
      'giaTien': monAn.giaTien,
    }).then((value) {
      print('thêm món ăn thành công vào nhà hàng $idNhaHang');
    }).catchError((onError) {
      print('thêm món ăn không thành công vào nhà hàng $onError');
    });
  }

  void themDuLieuDenFiestore() {
    MonAn monAn = MonAn(
      IDMonAn: 'MA02',
      tenMon: 'Cá Chiên',
      hinhAnhMA: 'images/hinh_46,jpg',
      giaTien: 25.000,
    );

    String idNhaHang = 'NH01';

    themMonAnVaoNhaHang(monAn, idNhaHang);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(
        top: 20,
      ),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                SizedBox(
                  width: 5,
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
                GestureDetector(
                  onTap: () {
                    themDuLieuDenFiestore();
                  },
                  child: Container(
                    child: Text('data'),
                  ),
                ),
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

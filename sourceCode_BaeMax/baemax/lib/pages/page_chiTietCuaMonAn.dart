import 'package:baemax/models/gioHang.dart';
import 'package:baemax/pages/page_loiNhanToiNhaHang.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class chiTietCuaMonAnPage extends StatefulWidget {
  final String? IDMonAn;
  final String? IDNhaHang;
  final String tenMon;
  final String hinhAnhMA;
  final num giaTien;

  chiTietCuaMonAnPage({
    this.IDMonAn,
    this.IDNhaHang,
    required this.tenMon,
    required this.hinhAnhMA,
    required this.giaTien,
  });

  @override
  State<chiTietCuaMonAnPage> createState() => _chiTietCuaMonAnPageState();
}

class _chiTietCuaMonAnPageState extends State<chiTietCuaMonAnPage> {
  String chonMucDuong = '';
  String chonMucDa = '';
  String loiNhanTuKH = '';

  double giaTien = 0;
  int soLuong = 1;

  List<GioHang> gioHangItems = [];

  void addToCart(GioHang gioHang, {int quantity = 1}) async {
    try {
      final cartRef = FirebaseFirestore.instance.collection('gioHang');

      final querySnapshot =
          await cartRef.where('idMonAn', isEqualTo: gioHang.IDMonAn).get();

      if (querySnapshot.size > 0) {
        final cartItemRef = querySnapshot.docs.first.reference;
        await cartItemRef.update({'soLuongMonDuocChon': quantity});
      } else {
        final newCartItem = cartRef.doc();
        final data = {
          'idMonAn': gioHang.IDMonAn,
          'IDNhaHang': gioHang.IDNhaHang,
          'tenMon': gioHang.tenMon,
          'hinhAnhMA': gioHang.hinhAnhMA,
          'giaTien': gioHang.giaTien,
          'soLuongMonDuocChon': quantity,
        };
        await newCartItem.set(data);
      }

      print('Thêm dữ liệu vào giỏ hàng thành công');
    } catch (e) {
      print('Lỗi khi thêm dữ liệu vào giỏ hàng: $e');
    }
  }

  void xoaMonAnKhoiGioHang(int index) {
    setState(() {
      gioHangItems.removeAt(index);
    });
  }

  String tienTamTinh(double giaTien, int soLuong) {
    double tienTamTinh = giaTien * soLuong;
    return tienTamTinh.toStringAsFixed(3);
  }

  void layLoiNhanTuWidgetLoiNhan() async {
    final loiNhan = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => loiNhanToiNhaHangPage(
          initialText: loiNhanTuKH,
        ),
      ),
    );

    if (loiNhan != null) {
      setState(() {
        loiNhanTuKH = loiNhan;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          widget.tenMon,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
          size: 30,
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              height: 650,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 240,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        child: Image(
                          image: AssetImage(widget.hinhAnhMA),
                          fit: BoxFit.cover,
                          width: 150,
                          height: 150,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 25,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 270,
                                child: Text(
                                  widget.tenMon,
                                  style: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  softWrap: true,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    widget.giaTien.toStringAsFixed(3),
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          GestureDetector(
                            onTap: () {
                              layLoiNhanTuWidgetLoiNhan();
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Image(
                                  image: AssetImage(
                                    'images/hinh_77.png',
                                  ),
                                  width: 38,
                                  height: 38,
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Container(
                                  width: 280,
                                  child: Text(
                                    loiNhanTuKH.isEmpty
                                        ? 'Bạn có muốn nhắn tới nhà hàng không?'
                                        : loiNhanTuKH,
                                    // 'loiNhan: ${loiNhanTuKH}',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                    softWrap: true,
                                  ),
                                ),
                                loiNhanTuKH.isNotEmpty
                                    ? const Image(
                                        image: AssetImage(
                                          'images/hinh_32.png',
                                        ),
                                        width: 25,
                                        height: 25,
                                        color: Colors.blue,
                                      )
                                    : const SizedBox(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            color: Color.fromARGB(255, 230, 230, 230),
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 25,
                            ),
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Chọn mức đường',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Chọn ít nhất 1 mục',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.grey,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  child: RadioListTile(
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text(
                                          '0% đường',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                          ),
                                        ),
                                        Text(
                                          '0đ',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                    value: '0duong',
                                    groupValue: chonMucDuong,
                                    onChanged: (value) {
                                      setState(() {
                                        chonMucDuong = value.toString();
                                      });
                                    },
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.grey,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  child: RadioListTile(
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text(
                                          '50% đường',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                          ),
                                        ),
                                        Text(
                                          '0đ',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                    value: '50duong',
                                    groupValue: chonMucDuong,
                                    onChanged: (value) {
                                      setState(() {
                                        chonMucDuong = value.toString();
                                      });
                                    },
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.grey,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  child: RadioListTile(
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text(
                                          '100% đường',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                          ),
                                        ),
                                        Text(
                                          '0đ',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                    value: '100duong',
                                    groupValue: chonMucDuong,
                                    onChanged: (value) {
                                      setState(() {
                                        chonMucDuong = value.toString();
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            color: Color.fromARGB(255, 230, 230, 230),
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 25,
                            ),
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Chọn mức đá',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Chọn ít nhất 1 mục',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.grey,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  child: RadioListTile(
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text(
                                          '0% đá',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                          ),
                                        ),
                                        Text(
                                          '0đ',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                    value: '0da',
                                    groupValue: chonMucDa,
                                    onChanged: (value) {
                                      setState(() {
                                        chonMucDa = value.toString();
                                      });
                                    },
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.grey,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  child: RadioListTile(
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text(
                                          '50% đá',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                          ),
                                        ),
                                        Text(
                                          '0đ',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                    value: '50da',
                                    groupValue: chonMucDa,
                                    onChanged: (value) {
                                      setState(() {
                                        chonMucDa = value.toString();
                                      });
                                    },
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.grey,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  child: RadioListTile(
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text(
                                          '100% đá',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                          ),
                                        ),
                                        Text(
                                          '0đ',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                    value: '100da',
                                    groupValue: chonMucDa,
                                    onChanged: (value) {
                                      setState(() {
                                        chonMucDa = value.toString();
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                color: soLuong < 2
                                    ? const Color.fromARGB(255, 238, 238, 238)
                                    : const Color.fromARGB(255, 224, 224, 224),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TextButton(
                                onPressed: soLuong < 2
                                    ? null
                                    : () {
                                        setState(() {
                                          soLuong--;
                                        });
                                      },
                                child: Text(
                                  '-',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: soLuong < 2
                                        ? const Color.fromARGB(
                                            255, 138, 138, 138)
                                        : Colors.blue,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              '${soLuong}',
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 224, 224, 224),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TextButton(
                                onPressed: soLuong > 9
                                    ? null
                                    : () {
                                        setState(() {
                                          soLuong++;
                                        });
                                      },
                                child: const Text(
                                  '+',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 55,
                      width: 230,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue,
                      ),
                      child: TextButton(
                        onPressed: () async {
                          List<dynamic> soLuongVaIdMonAn = [
                            soLuong,
                            widget.IDMonAn,
                          ];

                          final gioHang = GioHang(
                              IDMonAn: widget.IDMonAn,
                              IDNhaHang: widget.IDNhaHang,
                              tenMon: widget.tenMon,
                              hinhAnhMA: widget.hinhAnhMA,
                              giaTien: widget.giaTien.toDouble(),
                              soLuongMonDuocChon: soLuong);
                          addToCart(gioHang, quantity: soLuong);
                          setState(() {
                            gioHangItems.add(gioHang);
                          });

                          print('${widget.IDNhaHang}');

                          Navigator.pop(context, soLuongVaIdMonAn);
                        },
                        child: Text(
                          'Thêm ${tienTamTinh(widget.giaTien.toDouble(), soLuong)} đ',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

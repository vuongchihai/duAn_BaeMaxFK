import 'dart:async';

import 'package:baemax/models/MonAn.dart';
import 'package:baemax/pages/page_chiTietCuaMonAn.dart';
import 'package:baemax/pages/page_gioHang.dart';
import 'package:baemax/pages/page_trangThanhToan.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:tiengviet/tiengviet.dart';

class chiTietNhaHangPage extends StatefulWidget {
  final String? IDNhaHang;
  final String tenNH;
  final String anhDaiDienNH;
  final String diaChiNH;
  final num khoangCach;
  final num danhGia;
  final num SLDaBan;

  chiTietNhaHangPage({
    this.IDNhaHang,
    required this.tenNH,
    required this.anhDaiDienNH,
    required this.diaChiNH,
    required this.khoangCach,
    required this.danhGia,
    required this.SLDaBan,
  });

  @override
  State<chiTietNhaHangPage> createState() => _chiTietNhaHangPageState();
}

class _chiTietNhaHangPageState extends State<chiTietNhaHangPage> {
  late ScrollController scrollController;
  late bool showAppBar;
  bool showAppBarDanhMucLoaiMonAn = false;
  late Color iconColor;
  double khoangCachTruocKhiAnAppBarDM = 25;
  bool isContainerVisiable = false;
  late bool checkedHeart;
  int soLuong = 0;
  late String idMonVuaDuocThem;
  List<MonAn> monAnList = [];

  void layMonAnTuNhaHang(String? IDNhaHang) {
    FirebaseFirestore.instance
        .collection('nhaHang')
        .doc(IDNhaHang)
        .collection('monAn')
        .get()
        .then((querySnapshot) {
      if (querySnapshot != null) {
        List<MonAn> fetchedMonAnList = [];
        querySnapshot.docs.forEach((document) {
          MonAn monAn = MonAn(
            IDMonAn: document.id,
            tenMon: document['tenMon'],
            hinhAnhMA: document['hinhAnhMA'],
            giaTien: document['giaTien'].toDouble(),
          );
          fetchedMonAnList.add(monAn);
        });
        setState(() {
          monAnList = fetchedMonAnList;
        });
      } else {
        print('Không có dữ liệu món ăn');
      }
    }).catchError((error) {
      print('Lỗi khi truy vấn món ăn: $error');
    });
  }

  void hienThiContainerTimKiem() {
    setState(() {
      isContainerVisiable = true;
    });
  }

  int soLuongMonAnTrongGioHang = 0;
  double tongTienMonAnTrongGioHang = 0;

  Stream<QuerySnapshot> cartStream =
      FirebaseFirestore.instance.collection('gioHang').snapshots();

  void demSoLuongMonAnTrongGio() {
    cartStream.listen(
      (QuerySnapshot snapshot) {
        int calculatedTotalQuantity = 0;
        for (var doc in snapshot.docs) {
          final data = doc.data() as Map<String, dynamic>;
          final soLuong = data['soLuongMonDuocChon'] as int;
          calculatedTotalQuantity += soLuong;
        }
        if (mounted) {
          setState(() {
            soLuongMonAnTrongGioHang = calculatedTotalQuantity;
          });
        }
      },
    );
  }

  void tongTienTrongGio() {
    cartStream.listen((QuerySnapshot snapshot) {
      double tongTien = 0;
      for (var doc in snapshot.docs) {
        final data = doc.data() as Map<String, dynamic>;
        final giaMon = data['giaTien'] as double;
        final soLuong = data['soLuongMonDuocChon'] as int;
        tongTien += giaMon * soLuong;
      }
      if (mounted) {
        setState(() {
          tongTienMonAnTrongGioHang = tongTien;
        });
      }
    });
  }

  List<Map<String, dynamic>> searchResult = [];

  void timKiemMonAnTrongNhaHang(String query) async {
    final uppercaseQuery = TiengViet.parse(query).toUpperCase();

    final result = await FirebaseFirestore.instance
        .collection('nhaHang')
        .doc(widget.IDNhaHang)
        .collection('monAn')
        .orderBy('tenMon')
        .startAt([uppercaseQuery]).endAt([uppercaseQuery + '\uf8ff']).get();

    setState(() {
      searchResult = result.docs.map((doc) => doc.data()).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    showAppBar = true;
    iconColor = Colors.white;
    checkedHeart = false;

    scrollController.addListener(() {
      if (scrollController.offset > 0 &&
          scrollController.position.userScrollDirection ==
              ScrollDirection.reverse) {
        setState(() {
          showAppBar = false;
          iconColor = Colors.black;
        });
      } else if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        setState(() {
          showAppBar = true;
          iconColor = Colors.white;
        });
      }
      if (scrollController.offset > khoangCachTruocKhiAnAppBarDM &&
          !scrollController.position.outOfRange) {
        setState(() {
          showAppBarDanhMucLoaiMonAn = true;
        });
      } else {
        setState(() {
          showAppBarDanhMucLoaiMonAn = false;
        });
      }
    });

    layMonAnTuNhaHang(widget.IDNhaHang);
    print('${widget.IDNhaHang}');

    demSoLuongMonAnTrongGio();
    tongTienTrongGio();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  color: Color.fromARGB(255, 225, 225, 225),
                  child: Column(
                    children: [
                      Container(
                        child: Stack(
                          children: [
                            Container(
                              child: Column(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 300,
                                    child: Image(
                                      image: AssetImage(widget.anhDaiDienNH),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    height: 100,
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: 230,
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
                                      blurRadius: 1,
                                      spreadRadius: 1,
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
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 3,
                                        vertical: 3,
                                      ),
                                      child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image(
                                            image: AssetImage(
                                                'images/hinh_78.png'),
                                            width: 27,
                                            height: 27,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'ĐỐI TÁC CỦA BEAMAX',
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      widget.tenNH,
                                      style: const TextStyle(
                                        fontSize: 25,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      width: 300,
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 140,
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              '${widget.khoangCach}km',
                                              style: const TextStyle(
                                                fontSize: 20,
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: Container(
                                              width: 150,
                                              child: Text(
                                                widget.diaChiNH,
                                                style: const TextStyle(
                                                  fontSize: 20,
                                                  color: Color.fromARGB(
                                                      255, 110, 109, 109),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: const Row(
                                    children: [
                                      Image(
                                        image: AssetImage('images/hinh_19.png'),
                                        width: 30,
                                        height: 30,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Giao bởi tài xế',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Text(
                                  'Thay đổi',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      const Image(
                                        image: AssetImage('images/hinh_28.png'),
                                        width: 30,
                                        height: 30,
                                        color: Colors.yellow,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        '${widget.danhGia}',
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        '(${widget.SLDaBan}+)',
                                        style: const TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      const Image(
                                        image: AssetImage('images/hinh_79.png'),
                                        width: 30,
                                        height: 30,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        '${widget.SLDaBan}+ đã bán',
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Text(
                                  'Xem đánh giá',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        color: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Nhất định phải thử',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Image(
                                  image: AssetImage('images/hinh_19.png'),
                                  width: 30,
                                  height: 30,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 230,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: monAnList.length,
                                  itemBuilder: (context, index) {
                                    MonAn monAn = monAnList[index];
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                chiTietCuaMonAnPage(
                                              IDNhaHang: widget.IDNhaHang,
                                              IDMonAn: monAn.IDMonAn,
                                              tenMon: monAn.tenMon,
                                              hinhAnhMA: monAn.hinhAnhMA,
                                              giaTien: monAn.giaTien,
                                            ),
                                          ),
                                        ).then((value) {
                                          if (value != null &&
                                              value is List<dynamic> &&
                                              value.length == 2) {
                                            setState(() {
                                              soLuong = value[0];
                                              idMonVuaDuocThem = value[1];
                                            });
                                            print(
                                                'sl: $soLuong - TONG: $idMonVuaDuocThem');
                                          }
                                        });
                                      },
                                      child: Container(
                                        width: 180,
                                        margin: EdgeInsets.only(
                                          right: 20,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image(
                                                image:
                                                    AssetImage(monAn.hinhAnhMA),
                                                fit: BoxFit.cover,
                                                width: 180,
                                                height: 150,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              width: 180,
                                              child: Text(
                                                monAn.tenMon,
                                                style: const TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black,
                                                ),
                                                softWrap: true,
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Thập cẩm/ Mixed',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Image(
                                  image: AssetImage('images/hinh_19.png'),
                                  width: 30,
                                  height: 30,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 200,
                                      height: 130,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Bột khoai môn 3 trứng',
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                            ),
                                            softWrap: true,
                                          ),
                                          Text(
                                            '45.000 đ',
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image(
                                        image: AssetImage('images/hinh_73.jpg'),
                                        fit: BoxFit.cover,
                                        width: 150,
                                        height: 150,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 135,
            child: Column(
              children: [
                //appabr + icon
                Container(
                  height: 80,
                  color: !showAppBarDanhMucLoaiMonAn
                      ? Colors.transparent
                      : Colors.white,
                  padding: const EdgeInsets.only(
                    top: 20,
                    right: 10,
                    left: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape
                                .circle, // Đặt hình dạng thành hình tròn
                            color: !showAppBarDanhMucLoaiMonAn
                                ? Color.fromARGB(255, 101, 101, 101)
                                : Colors.transparent,
                          ),
                          child: Icon(
                            Icons.arrow_back,
                            color: !showAppBarDanhMucLoaiMonAn
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                      !showAppBarDanhMucLoaiMonAn
                          ? AnimatedOpacity(
                              opacity: 1,
                              duration: const Duration(milliseconds: 400),
                              child: Container(
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        print('đã nhấn tìm kiếm');
                                        hienThiContainerTimKiem();
                                      },
                                      child: Container(
                                        width: 40,
                                        height: 40,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape
                                              .circle, // Đặt hình dạng thành hình tròn
                                          color: Color.fromARGB(
                                              255, 101, 101, 101),
                                        ),
                                        child: Icon(
                                          Icons.search,
                                          color: iconColor,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        print('đã nhấn tym');
                                        setState(() {
                                          checkedHeart = !checkedHeart;
                                        });
                                      },
                                      child: Container(
                                        width: 40,
                                        height: 40,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape
                                              .circle, // Đặt hình dạng thành hình tròn
                                          color: Color.fromARGB(
                                              255, 101, 101, 101),
                                        ),
                                        child: Icon(
                                          checkedHeart
                                              ? Icons.favorite
                                              : Icons.favorite_outline,
                                          color: checkedHeart
                                              ? Colors.red
                                              : iconColor,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        print('$soLuongMonAnTrongGioHang');
                                      },
                                      child: Container(
                                        width: 40,
                                        height: 40,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape
                                              .circle, // Đặt hình dạng thành hình tròn
                                          color: Color.fromARGB(
                                              255, 101, 101, 101),
                                        ),
                                        child: Icon(
                                          Icons.share,
                                          color: iconColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : AnimatedOpacity(
                              opacity: 1,
                              duration: const Duration(milliseconds: 400),
                              child: Container(
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        print('đã nhấn tìm kiếm');
                                        hienThiContainerTimKiem();
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                        ),
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 245, 235, 235),
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        child: Row(
                                          children: [
                                            const Icon(
                                              Icons.search,
                                              color: Colors.grey,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Container(
                                              width: 238,
                                              child: Text(
                                                '${widget.tenNH} - ${widget.diaChiNH}',
                                                // '${widget.item.tenNH}',
                                                style: const TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black,
                                                ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        print('đã nhấn tym');
                                        setState(() {
                                          checkedHeart = !checkedHeart;
                                        });
                                      },
                                      child: Container(
                                        width: 40,
                                        height: 40,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape
                                              .circle, // Đặt hình dạng thành hình tròn
                                          color: Colors.transparent,
                                        ),
                                        child: Icon(
                                          checkedHeart
                                              ? Icons.favorite
                                              : Icons.favorite_outline,
                                          color: checkedHeart
                                              ? Colors.red
                                              : Colors.black,
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
                // appbar + search
                Expanded(
                  child: AnimatedOpacity(
                    opacity: showAppBarDanhMucLoaiMonAn ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 300),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 5, // làm mềm
                            spreadRadius: 0, // mở rộng
                            offset: const Offset(
                              0, // di chuyển sang phải theo chiều ngang
                              5.0, // dieu chuyển xuống dưới theo chiều dọc
                            ),
                          ),
                        ],
                      ),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 55,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 15,
                              ),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 163, 240, 225),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                'Món hot',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 1, 106, 78),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            child: Container(
                              height: 55,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 15,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text(
                                'Milk tea',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            child: Container(
                              height: 55,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 15,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text(
                                'Milk',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            child: Container(
                              height: 55,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 15,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text(
                                'Tea',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            child: Container(
                              height: 55,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 15,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text(
                                'Special drinks',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            child: Container(
                              height: 55,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 15,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text(
                                'Soda',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // search
          isContainerVisiable
              ? Container(
                  height: double.infinity,
                  color: Colors.grey.withOpacity(0.3),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                          top: 20,
                        ),
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 50,
                              child: const Icon(
                                Icons.search,
                              ),
                            ),
                            Container(
                              width: 300,
                              child: TextField(
                                decoration: const InputDecoration(
                                  hintText: 'Tìm trong thực đơn',
                                  hintStyle: TextStyle(
                                    fontSize: 19,
                                  ),
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                                onChanged: (query) {
                                  timKiemMonAnTrongNhaHang(query);
                                },
                              ),
                            ),
                            Container(
                              width: 60,
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    isContainerVisiable = false;
                                  });
                                },
                                child: const Text(
                                  'Hủy',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.white,
                          child: ListView.builder(
                            itemCount: searchResult.length,
                            itemBuilder: ((context, index) {
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                margin: const EdgeInsets.only(
                                  bottom: 10,
                                ),
                                decoration: const BoxDecoration(
                                    border: Border(
                                  bottom: BorderSide(
                                      color: Colors.grey, width: 0.8),
                                )),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 250,
                                            child: Text(
                                              '${searchResult[index]['tenMon']}',
                                              style: const TextStyle(
                                                fontSize: 20,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              softWrap: true,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          Text(
                                            NumberFormat('0.000').format(
                                                searchResult[index]['giaTien']),
                                            style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 110,
                                      height: 110,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image(
                                          image: AssetImage(
                                              searchResult[index]['hinhAnhMA']),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : SizedBox(),

          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Visibility(
              visible: soLuong != 0,
              maintainSize: false,
              maintainState: true,
              maintainAnimation: true,
              child: Container(
                height: 100,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => gioHangPage(),
                          ),
                        );
                      },
                      child: Container(
                        height: 65,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Colors.blue,
                            width: 2,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Image(
                              image: AssetImage('images/hinh_79.png'),
                              height: 35,
                              width: 35,
                              fit: BoxFit.fill,
                              color: Colors.blue,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              soLuongMonAnTrongGioHang.toString(),
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => trangThanhToanPage(),
                          ),
                        );
                      },
                      child: Container(
                        height: 65,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue,
                        ),
                        child: Text(
                          'Trang thanh toán ${NumberFormat("0.000").format(tongTienMonAnTrongGioHang)}đ',
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
          ),
        ],
      ),
    );
  }
}

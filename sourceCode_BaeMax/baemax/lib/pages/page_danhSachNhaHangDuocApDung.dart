import 'package:baemax/modal/nhaHang.dart';
import 'package:baemax/widgets/listNhaHang_chiTietNhaHang.dart';
import 'package:baemax/widgets/listNhaHang_danhMucVaCuaHang.dart';
import 'package:baemax/widgets/listNhaHang_sapXep.dart';
import 'package:flutter/material.dart';

class nhaHangDuocApDungGiamGiaPage extends StatefulWidget {
  const nhaHangDuocApDungGiamGiaPage({super.key});

  @override
  State<nhaHangDuocApDungGiamGiaPage> createState() =>
      _nhaHangDuocApDungGiamGiaPageState();
}

class _nhaHangDuocApDungGiamGiaPageState
    extends State<nhaHangDuocApDungGiamGiaPage> {
  final List<nhaHang> NhaHangs = [
    nhaHang(
      idNH: 'NH001',
      tenNH: 'PHÚC LONG',
      diaChiNH: 'Cà MauCà MauCà MauCà MauCà MauCà MauCà MauCà Mau',
      monAn: 'Bánh canh cá lóc',
      khoangCach: 9.0,
      danhGia: 4.5,
    ),
    nhaHang(
      idNH: 'NH002',
      tenNH: 'ĂN VẶT',
      diaChiNH: '299 Tân Kỳ Tân Qúy, Phường Tân Sơn Nhì, Quận Tân Phú, Tp.HCM',
      monAn: 'Bánh canh cá lóc',
      khoangCach: 0.1,
      danhGia: 3.7,
    ),
    nhaHang(
      idNH: 'NH003',
      tenNH: 'CƠM',
      diaChiNH: '299 Tân Kỳ Tân Qúy, Phường Tân Sơn Nhì, Quận Tân Phú, Tp.HCM',
      monAn: 'Bánh canh cá lóc',
      khoangCach: 2.8,
      danhGia: 1.5,
    ),
    nhaHang(
      idNH: 'NH004',
      tenNH: 'TRÀ',
      diaChiNH: '299 Tân Kỳ Tân Qúy, Phường Tân Sơn Nhì, Quận Tân Phú, Tp.HCM',
      monAn: 'Bánh canh cá lóc',
      khoangCach: 9.0,
      danhGia: 0.5,
    ),
    nhaHang(
      idNH: 'NH005',
      tenNH: 'TOCO TOCO',
      diaChiNH: '299 Tân Kỳ Tân Qúy, Phường Tân Sơn Nhì, Quận Tân Phú, Tp.HCM',
      monAn: 'Bánh canh cá lóc',
      khoangCach: 9.0,
      danhGia: 2.2,
    ),
    nhaHang(
      idNH: 'NH006',
      tenNH: 'MÌ',
      diaChiNH: '299 Tân Kỳ Tân Qúy, Phường Tân Sơn Nhì, Quận Tân Phú, Tp.HCM',
      monAn: 'Bánh canh cá lóc',
      khoangCach: 9.0,
      danhGia: 2.5,
    ),
    nhaHang(
      idNH: 'NH007',
      tenNH: 'LẨU',
      diaChiNH: '299 Tân Kỳ Tân Qúy, Phường Tân Sơn Nhì, Quận Tân Phú, Tp.HCM',
      monAn: 'Bánh canh cá lóc',
      khoangCach: 9.0,
      danhGia: 1.0,
    ),
    nhaHang(
      idNH: 'NH008',
      tenNH: 'KATI NAT',
      diaChiNH: '299 Tân Kỳ Tân Qúy, Phường Tân Sơn Nhì, Quận Tân Phú, Tp.HCM',
      monAn: 'Bánh canh cá lóc',
      khoangCach: 9.0,
      danhGia: 5.0,
    ),
  ];

  bool isCheckedKM = false;
  bool isCheckedDMC = false;
  bool isCheckedDT = false;
  String selectedSortStyle = '';
  int soLuongDMCHDuocChon = 0;
  String chonDanhMucCuaHang = '';
  String viTriDanhMucCuaHangDuocCho = '';

  void capNhatChonDanhMucCuaHang(String value, String viTri) {
    setState(() {
      chonDanhMucCuaHang += '$value ';
      viTriDanhMucCuaHangDuocCho += '$viTri ';
    });
  }

  void capNhatSoLuongDMCHDuocChon(int soLuongMoi) {
    setState(() {
      soLuongDMCHDuocChon = soLuongMoi;
      if(soLuongDMCHDuocChon == 0){
        chonDanhMucCuaHang = '';
        viTriDanhMucCuaHangDuocCho = '';
      }
    });
  }

  List<nhaHang> ketQuaTimKiem = [];

  List<nhaHang> timKiemVaSapXepTangDan(
      List<nhaHang> danhSachNhaHang, String kieuSapXep) {
    List<nhaHang> ketQuaTimKiem = danhSachNhaHang
        .where((nhaHang) => chonDanhMucCuaHang
            .trim()
            .toLowerCase()
            .split(' ')
            .any((tukhoa) => nhaHang.tenNH.toLowerCase().contains(tukhoa)))
        .toList();

    if (kieuSapXep == 'Gần nhất') {
      ketQuaTimKiem.sort((a, b) => a.khoangCach.compareTo(b.khoangCach));
    } else if (kieuSapXep == 'Đánh giá tốt') {
      ketQuaTimKiem.sort((a, b) => b.danhGia.compareTo(a.danhGia));
    } else {
      ketQuaTimKiem.sort((a, b) => a.tenNH.compareTo(b.tenNH));
    }

    return ketQuaTimKiem;
  }

  Widget build(BuildContext context) {
    List<nhaHang> ketQuaTimKiem =
        timKiemVaSapXepTangDan(NhaHangs, selectedSortStyle);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        centerTitle: true,
        title: const Text(
          'List nhà hàng áp dụng mã',
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
      ),
      body: Column(
        children: [
          // Text('selectedItem: $chonDanhMucCuaHang'),
          // Text('IndexselectedItem: $viTriDanhMucCuaHangDuocCho'),
          Container(
            margin: const EdgeInsets.only(
              top: 15,
            ),
            padding: const EdgeInsets.only(
              left: 10,
            ),
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => sapXepListNhaHang(),
                      ),
                    ).then((value) {
                      if (value != null) {
                        setState(() {
                          selectedSortStyle = value.toString();
                        });
                      }
                    });
                  },
                  child: Container(
                    width: 125,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: const Color.fromARGB(255, 232, 231, 231),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 75,
                          child: Text(
                            selectedSortStyle.isEmpty
                                ? 'Sắp xếp'
                                : selectedSortStyle,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 66, 66, 66),
                              fontWeight: FontWeight.w500,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        const Icon(
                          Icons.arrow_drop_down,
                          color: Color.fromARGB(255, 66, 66, 66),
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Lọc',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 66, 66, 66),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => danhMucVaCuaHangListNhaHang(
                          onCheckboxCountChanged: capNhatSoLuongDMCHDuocChon,
                          onItemSelected: capNhatChonDanhMucCuaHang,
                          initialIndexSelectedItem: viTriDanhMucCuaHangDuocCho,
                        ),
                      ),
                    ).then((value){
                      if(value != null && value is String){
                        setState(() {
                          viTriDanhMucCuaHangDuocCho = value;
                        });
                      }
                    });
                  },
                  child: Container(
                    width: 280,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: const Color.fromARGB(255, 232, 231, 231),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          soLuongDMCHDuocChon.toString() == '0'
                              ? 'Danh mục & cửa hàng'
                              : 'Danh mục & cửa hàng ${soLuongDMCHDuocChon.toString()}',
                          // 'Danh mục & cửa hàng ${soLuongDMCHDuocChon.toString()}',
                          style: const TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 66, 66, 66),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Icon(
                          Icons.arrow_drop_down,
                          color: Color.fromARGB(255, 66, 66, 66),
                          size: 30,
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
                    setState(() {
                      isCheckedKM = !isCheckedKM;
                    });
                  },
                  child: Container(
                    width: 130,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: const Color.fromARGB(255, 232, 231, 231),
                      ),
                      color: isCheckedKM
                          ? const Color.fromARGB(255, 232, 231, 231)
                          : Colors.transparent,
                    ),
                    child: Text(
                      'Khuyến mãi',
                      style: TextStyle(
                        fontSize: 20,
                        color: isCheckedKM
                            ? Colors.black
                            : const Color.fromARGB(255, 66, 66, 66),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isCheckedDMC = !isCheckedDMC;
                    });
                  },
                  child: Container(
                    width: 150,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: const Color.fromARGB(255, 232, 231, 231),
                      ),
                      color: isCheckedDMC
                          ? const Color.fromARGB(255, 232, 231, 231)
                          : Colors.transparent,
                    ),
                    child: Text(
                      'Đang mở cửa',
                      style: TextStyle(
                        fontSize: 20,
                        color: isCheckedDMC
                            ? Colors.black
                            : const Color.fromARGB(255, 66, 66, 66),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isCheckedDT = !isCheckedDT;
                    });
                  },
                  child: Container(
                    width: 100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: const Color.fromARGB(255, 232, 231, 231),
                      ),
                      color: isCheckedDT
                          ? const Color.fromARGB(255, 232, 231, 231)
                          : Colors.transparent,
                    ),
                    child: Text(
                      'Đối tác',
                      style: TextStyle(
                        fontSize: 20,
                        color: isCheckedDT
                            ? Colors.black
                            : const Color.fromARGB(255, 66, 66, 66),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(
              left: 10,
            ),
            child: Text(
              '${ketQuaTimKiem.length} nhà hàng tìm thấy',
              style: const TextStyle(
                fontSize: 20,
                color: const Color.fromARGB(255, 66, 66, 66),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    if (ketQuaTimKiem.isNotEmpty)
                      Column(
                        children: ketQuaTimKiem
                            .map((item) => dsNhaHang(item: item))
                            .toList(),
                      )
                    else
                      Text('Không tìm thấy nhà hàng'),
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

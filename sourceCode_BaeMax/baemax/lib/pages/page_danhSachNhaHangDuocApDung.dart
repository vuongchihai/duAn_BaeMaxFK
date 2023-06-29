import 'package:baemax/widgets/dsNhaHangDuocChon_dsChonTiemKiem.dart';
import 'package:flutter/material.dart';

class nhaHangDuocApDungGiamGiaPage extends StatefulWidget {
  const nhaHangDuocApDungGiamGiaPage({super.key});

  @override
  State<nhaHangDuocApDungGiamGiaPage> createState() =>
      _nhaHangDuocApDungGiamGiaPageState();
}

class _nhaHangDuocApDungGiamGiaPageState
    extends State<nhaHangDuocApDungGiamGiaPage> {
  final listDanhMucChon = [
    'Sắp xếp',
    'Chọn',
    'Danh mục & cửa hàng',
    'Sắp xếp',
    'Chọn',
    'Danh mục & cửa hàng',
  ];

  bool isCheckedKM = false;
  bool isCheckedDMC = false;
  bool isCheckedDT = false;

  @override
  Widget build(BuildContext context) {
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
                    print('object');
                  },
                  child: Container(
                    width: 125,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: const Color.fromARGB(255, 232, 231, 231),
                      ),
                    ),
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Sắp xếp',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 66, 66, 66),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
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
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {
                    print('object');
                  },
                  child: Container(
                    width: 280,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: const Color.fromARGB(255, 232, 231, 231),
                      ),
                    ),
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Danh mục & cửa hàng (1)',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 66, 66, 66),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
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
              left: 15,
            ),
            child: Text(
              '577 nhà hàng tìm thấy',
              style: TextStyle(
                fontSize: 20,
                color: const Color.fromARGB(255, 66, 66, 66),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            // child: ListView.builder(
            //   itemCount: listDanhMucChon.length,
            //   itemBuilder: (context, index) {
            //     return dsChonTimKiem(
            //       child: listDanhMucChon[index],
            //     );
            //   },
            // ),
            child: Container(
              alignment: Alignment.centerLeft,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      color: Colors.red,
                      child: Text(
                        'asdfasdf',
                        style: const TextStyle(
                          fontSize: 40,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 200,
                      color: Colors.red,
                      child: Text(
                        'asdfasdf',
                        style: const TextStyle(
                          fontSize: 40,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 200,
                      color: Colors.red,
                      child: Text(
                        'asdfasdf',
                        style: const TextStyle(
                          fontSize: 40,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 200,
                      color: Colors.red,
                      child: Text(
                        'asdfasdf',
                        style: const TextStyle(
                          fontSize: 40,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 200,
                      color: Colors.red,
                      child: Text(
                        'asdfasdf',
                        style: const TextStyle(
                          fontSize: 40,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
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

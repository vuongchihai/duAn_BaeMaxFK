import 'package:flutter/material.dart';

class danhMucVaCuaHangListNhaHang extends StatefulWidget {
  danhMucVaCuaHangListNhaHang({super.key});

  @override
  State<danhMucVaCuaHangListNhaHang> createState() =>
      _danhMucVaCuaHangListNhaHangState();
}

class _danhMucVaCuaHangListNhaHangState
    extends State<danhMucVaCuaHangListNhaHang> {
  String? chonCuaHang;

  List<bool> isCheckedListCheck = [
    false,
    false,
    false,
    false,
  ];
  List<String> checkBoxTexts = [
    'Trà/ Cà phê',
    'Trà sữa',
    'Sinh tố/ Nước ép/ Sữa',
    'Sữa chua trân châu',
    'Ăn vặt',
    'Sald/ Thực phẩm bổ dưỡng',
    'Cơm - Cơm tấm',
    'Cơm - Các loại khác',
    'Bánh mì/ Xôi',
    'Mỳ/ Cháo/ Bún/ Phở',
    'Pizza',
    'Đồ ăn nhanh',
    'Món truyền thống/ Đặc sản',
    'Cá/ Ốc/ Hải sản',
    'Lẩu/ Nướng',
    'Đồ ăn nước ngoài',
    'Tráng miệng',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        centerTitle: true,
        title: const Text(
          'Danh mục & cửa hàng',
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
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black, width: 1),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Cửa hàng',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  RadioListTile(
                    title: const Text(
                      'Mart',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    value: 'mart',
                    groupValue: chonCuaHang,
                    controlAffinity: ListTileControlAffinity.trailing,
                    onChanged: (value) {
                      setState(() {
                        chonCuaHang = value.toString();
                        print(chonCuaHang);
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text(
                      'BAEMAX Kitchen',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    value: 'baemaxkitchen',
                    controlAffinity: ListTileControlAffinity.trailing,
                    groupValue: chonCuaHang,
                    onChanged: (value) {
                      setState(() {
                        chonCuaHang = value.toString();
                        print(chonCuaHang);
                      });
                    },
                  ),
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black, width: 1),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Danh mục',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  for (int i = 0; i < checkBoxTexts.length; i++)
                    CheckboxListTile(
                      title: Text(
                        checkBoxTexts[i],
                        style:
                            const TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      value: isCheckedListCheck[i],
                      onChanged: (bool? value) {
                        if (value != null) {
                          setState(() {
                            isCheckedListCheck[i] = value;
                          });
                        }
                      },
                    ),
                ],
              ),
              // child: Column(
              //   children: List.generate(checkBoxTexts.length, (index) {
              //     return Column(
              //       children: [
              //         CheckboxListTile(
              //           title: Text(
              //             checkBoxTexts[index],
              //             style: const TextStyle(
              //               fontSize: 20,
              //               color: Colors.black,
              //             ),
              //           ),
              //           value: isCheckedListCheck[index],
              //           onChanged: (bool? value) {
              //             if (value != null) {
              //               setState(() {
              //                 isCheckedListCheck[index] = value;
              //               });
              //             }
              //           },
              //         ),
              //       ],
              //     );
              //   }),
              // ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'page_trangThanhToan.dart';

class gioHangPage extends StatefulWidget {
  const gioHangPage({super.key});

  @override
  State<gioHangPage> createState() => _gioHangPageState();
}

class _gioHangPageState extends State<gioHangPage> {
  int soLuong = 1;

  void hienThiCacItemTrongGio() async {
   // Truy cập collection "giỏ hàng"
  QuerySnapshot cartSnapshot = await FirebaseFirestore.instance
      .collection('gioHang')
      .get();

  // Lặp qua các documents trong collection "giỏ hàng"
  for (var cartDoc in cartSnapshot.docs) {
    // Ép kiểu "cartDoc.data()" sang kiểu "Map<String, dynamic>"
    Map<String, dynamic>? cartData = cartDoc.data() as Map<String, dynamic>?;

    if (cartData != null) {
      // Lấy thông tin từ trường "id món ăn", "id nhà hàng" và "số lượng món ăn"
      String? foodItemId = cartData['idMonAn'];
      String? restaurantId = cartData['IDNhaHang'];
      int? quantity = cartData['soLuongMonDuocChon'];

      // Truy cập collection "món ăn" để lấy thông tin về "tên món" và "giá bán"
      DocumentSnapshot? foodItemSnapshot = await FirebaseFirestore.instance
          .collection('món ăn')
          .doc(foodItemId)
          .get();
      Map<String, dynamic>? foodItemData =
          foodItemSnapshot?.data() as Map<String, dynamic>?;

      String? foodItemName = foodItemData?['tenMon'];
      int? foodItemPrice = foodItemData?['giaTien'];

      // Truy cập collection "nhà hàng" để lấy thông tin về "tên nhà hàng"
      DocumentSnapshot? restaurantSnapshot = await FirebaseFirestore.instance
          .collection('nhà hàng')
          .doc(restaurantId)
          .get();
      Map<String, dynamic>? restaurantData =
          restaurantSnapshot?.data() as Map<String, dynamic>?;

      String? restaurantName = restaurantData?['tenNH'];

      // Kiểm tra null trước khi in ra thông tin
      if (foodItemName != null &&
          foodItemPrice != null &&
          restaurantName != null) {
        print('Tên món: $foodItemName');
        print('Số lượng: $quantity');
        print('Giá bán: $foodItemPrice');
        print('---');
      }
    }
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        centerTitle: true,
        title: const Text(
          'Giỏ hàng',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
          size: 30,
        ),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              hienThiCacItemTrongGio();
              print('đã nhấn xóa');
            },
            child: const Text(
              'Xóa',
              style: TextStyle(
                  fontSize: 18, color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        child: Column(
          children: [
            Container(
              height: 675,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 20,
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.black,
                            width: 0.3,
                          ),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            child: Text(
                              'Bún tươi mực thịt bầm',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                              softWrap: true,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: double.infinity,
                            child: Text(
                              'Trụng sẵn',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                              softWrap: true,
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '40.000đ',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 45,
                                      height: 45,
                                      decoration: BoxDecoration(
                                        color: soLuong < 2
                                            ? const Color.fromARGB(
                                                255, 238, 238, 238)
                                            : const Color.fromARGB(
                                                255, 224, 224, 224),
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
                                        child: const Text(
                                          '-',
                                          style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue,
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
                                        fontSize: 20,
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
                                        color: const Color.fromARGB(
                                            255, 224, 224, 224),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: TextButton(
                                        onPressed: soLuong < 10
                                            ? () {
                                                setState(() {
                                                  soLuong++;
                                                });
                                              }
                                            : null,
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
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => trangThanhToanPage(),
                    ),
                  );
                },
                child: Container(
                  height: 100,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  child: Container(
                    height: 60,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '1 Món',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Trang thanh toán',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '40.000đ',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
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

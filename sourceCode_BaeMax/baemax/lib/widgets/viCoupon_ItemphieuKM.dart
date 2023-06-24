import 'package:baemax/pages/page_chiTietPhieuKM.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ItemPhieuKMViCoupon extends StatelessWidget {
  ItemPhieuKMViCoupon({
    Key? key,
    required this.item,
  }) : super(key: key);

  var item;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => thongTinChiTietPhieuKMPage(item: item),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                color: Colors.white,
              ),
              height: 100,
              child: Row(
                children: <Widget>[
                  Container(
                    width: 5,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(13),
                          bottomLeft: Radius.circular(13)),
                      color: Colors.blue,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 65,
                          height: 65,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 2.5,
                            vertical: 2.5,
                          ),
                          decoration: BoxDecoration(
                            // color: const Color.fromARGB(255, 177, 215, 246),
                            gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.white, // Màu trắng ở trên
                                Colors
                                    .lightBlueAccent, // Màu xanh nước biển nhạt ở dưới
                              ],
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Image(
                            image: AssetImage(
                              'images/hinh_56.png',
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 230,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.ten_phieuKM,
                                style: const TextStyle(
                                  fontSize: 19,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                DateFormat('dd/MM/yyyy').format(item.HSD_phieuKM),
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
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
          GestureDetector(
            onTap: () {
              print('b');
            },
            child: Container(
              height: 100,
              padding: const EdgeInsets.symmetric(
                horizontal: 5,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                color: Colors.white,
              ),
              child: const Align(
                alignment: Alignment.center,
                child: Text(
                  'Chọn',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

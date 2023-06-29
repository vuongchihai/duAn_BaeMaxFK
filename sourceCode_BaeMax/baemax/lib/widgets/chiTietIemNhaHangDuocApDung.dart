import 'package:flutter/material.dart';

class itemChiTietNhaHangDuocApDung extends StatelessWidget {
  const itemChiTietNhaHangDuocApDung({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Colors.black,
          size: 30,
        ),
        actions: [
          GestureDetector(
            child: Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                shape: BoxShape.circle, // Đặt hình dạng thành hình tròn
                color: Color.fromARGB(255, 101, 101, 101),
              ),
              child: const Icon(Icons.search),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            child: Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                shape: BoxShape.circle, // Đặt hình dạng thành hình tròn
                color: Color.fromARGB(255, 101, 101, 101),
              ),
              child: const Icon(Icons.favorite_outline),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            child: Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                shape: BoxShape.circle, // Đặt hình dạng thành hình tròn
                color: Color.fromARGB(255, 101, 101, 101),
              ),
              child: const Icon(Icons.share),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SingleChildScrollView(
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
                          child: const Image(
                            image: AssetImage('images/hinh_73.jpg'),
                          ),
                        ),
                        Container(
                          height: 120,
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
                            blurRadius: 8,
                            spreadRadius: 2,
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
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: Colors.white,
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 3,
                              vertical: 3,
                            ),
                            child: Text(
                              'ĐỐI TÁC CỦA BEAMAX',
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            'BỘT CHIÊN KIM LOAN',
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '0.1km',
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 280,
                                child: Text(
                                  '15/44 Cầu Xéo, Tân Qúy, Tân Sơn Nhì, Tân Phú, Tp.HCM',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 110, 109, 109),
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            const Image(
                              image: AssetImage('images/hinh_19.png'),
                              width: 30,
                              height: 30,
                            ),
                            const SizedBox(
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
                  SizedBox(height: 10,),
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
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              '4.7',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              '(999+)',
                              style: TextStyle(
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
                              image: AssetImage('images/hinh_28.png'),
                              width: 30,
                              height: 30,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              '999+ đã bán',
                              style: TextStyle(
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
          ],
        ),
      ),
    );
  }
}

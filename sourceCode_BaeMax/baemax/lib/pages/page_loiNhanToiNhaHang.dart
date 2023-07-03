import 'package:flutter/material.dart';

class loiNhanToiNhaHangPage extends StatefulWidget {
  const loiNhanToiNhaHangPage({super.key});

  @override
  State<loiNhanToiNhaHangPage> createState() => _loiNhanToiNhaHangPageState();
}

class _loiNhanToiNhaHangPageState extends State<loiNhanToiNhaHangPage> {
  final TextEditingController loiNhanController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Lưu ý tới nhà hàng',
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
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.close,
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    child: TextField(
                      controller: loiNhanController,
                      decoration: const InputDecoration(
                        hintText: 'Ví dụ: không hành lá...',
                        hintStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                        ),
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      maxLines: null,
                      onChanged: (value) {
                        setState(() {
                          loiNhanController.text = value.isEmpty ? '' : value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 20,
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 246, 246, 246),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.warning_amber,
                            size: 30,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              child: const Text(
                                'Nhà hàng chỉ có thể đáp ứng những yêu cầu phù hợp/trong khả năng.',
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
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 50,
                      child: ElevatedButton(
                        onPressed: loiNhanController.text.isEmpty
                            ? null
                            : () {
                                Navigator.pop(context, loiNhanController.text);
                              },
                        child: const Text(
                          'Thêm',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
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

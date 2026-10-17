
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StudentScreen(),
    );
  }
}

class StudentScreen extends StatelessWidget {
  StudentScreen({super.key});

  final double diem = 8.5;

  // Hàm xếp loại học lực
  String xepLoai(double diem) {
    if (diem < 0 || diem > 10) {
      return 'Không hợp lệ';
    } else if (diem >= 8.0) {
      return 'Giỏi';
    } else if (diem >= 6.5) {
      return 'Khá';
    } else if (diem >= 5.0) {
      return 'Trung bình';
    } else {
      return 'Yếu';
    }
  }

  // Hàm chọn màu theo học lực
  Color mauXepLoai(double diem) {
    if (diem < 0 || diem > 10) {
      return Colors.grey;
    } else if (diem >= 8.0) {
      return Colors.green;
    } else if (diem >= 6.5) {
      return Colors.blue;
    } else if (diem >= 5.0) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F9),
      appBar: AppBar(
        title: Text(
          'Xếp loại học lực',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF304878),
      ),
      body: Column(
        children: [
          SizedBox(height: 16),

          // Khung hiển thị điểm chính
          Container(
            margin: EdgeInsets.all(14),
            padding: EdgeInsets.all(14),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Text(
                  'Điểm trung bình',
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 8),
                Text(
                  '$diem',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    xepLoai(diem),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: mauXepLoai(diem),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 8),

          // Tiêu đề kiểm tra thêm
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(left: 14, bottom: 8),
            child: Text(
              'KIỂM TRA THÊM',
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Danh sách điểm kiểm tra
          Container(
            margin: EdgeInsets.symmetric(horizontal: 14),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                dongDiem(9),
                Divider(),
                dongDiem(7),
                Divider(),
                dongDiem(5.5),
                Divider(),
                dongDiem(3),
                Divider(),
                dongDiem(11),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Tạo một dòng điểm và xếp loại
  Widget dongDiem(double diem) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Điểm ${diem.toStringAsFixed(diem % 1 == 0 ? 0 : 1)}'),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          decoration: BoxDecoration(
            color: mauXepLoai(diem).withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            xepLoai(diem),
            style: TextStyle(
              color: mauXepLoai(diem),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}


import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Class Student
class Student {
  String name;
  double? score;

  Student(this.name, this.score);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(    //(nền ngoài màu xám)
        backgroundColor: const Color(0xFFE5E7EB),
        body: Center(    //(căn giữa màn hình)
          child: Container( //(khung điện thoại màu đen)
            width: 375,
            height: 780,
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(40),
            ),
            child: ClipRRect(   //(bo góc màn hình)
              borderRadius: BorderRadius.circular(33),
              child: const StudentScreen(),
            ),
          ),
        ),
      ),
    );
  }
}

class StudentScreen extends StatelessWidget {
  const StudentScreen({super.key});

  // Danh sách sinh viên
  final List<Student> students = const [];

  // Hàm xếp loại từ Bài 2
  String xepLoai(double? diem) {
    if (diem == null) {
      return 'Chưa có điểm';
    } else if (diem < 0 || diem > 10) {
      return 'Không hợp lệ';
    } else if (diem >= 8) {
      return 'Giỏi';
    } else if (diem >= 6.5) {
      return 'Khá';
    } else if (diem >= 5) {
      return 'Trung bình';
    } else {
      return 'Yếu';
    }
  }

  // Chọn màu theo xếp loại
  Color mauXepLoai(double? diem) {
    if (diem == null) {
      return Colors.grey;
    } else if (diem < 0 || diem > 10) {
      return Colors.grey;
    } else if (diem >= 8) {
      return Colors.green;
    } else if (diem >= 6.5) {
      return Colors.blue;
    } else if (diem >= 5) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Dữ liệu có sẵn
    List<Student> danhSach = [
      Student('Mai Thị Thùy Linh', 9.0),
      Student('Trần Thị Bình', 7.2),
      Student('Lê Minh Chi', null),
      Student('Phạm Quốc Dũng', 4.5),
      Student('Võ Thanh Em', 5.8),
    ];

    // Tính toán bằng for + if
    double tongDiem = 0;
    double diemCaoNhat = 0;
    int soCoDiem = 0;
    int soGioi = 0;
    int soChuaCoDiem = 0;

    for (Student sv in danhSach) {
      if (sv.score == null) {
        soChuaCoDiem++;
      } else {
        double diem = sv.score!;

        tongDiem += diem;
        soCoDiem++;

        if (diem >= 8) {
          soGioi++;
        }

        if (diem > diemCaoNhat) {
          diemCaoNhat = diem;
        }
      }
    }

    double diemTrungBinh =
        soCoDiem > 0 ? tongDiem / soCoDiem : 0;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F9),
      body: Column(
        children: [
          // Thanh trạng thái điện thoại
          Container(
            height: 36,
            color: const Color(0xFF304878),
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '9:41',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: const [
                    Icon(Icons.wifi, color: Colors.white, size: 17),
                    SizedBox(width: 5),
                    Icon(
                      Icons.signal_cellular_alt,
                      color: Colors.white,
                      size: 16,
                    ),
                    SizedBox(width: 5),
                    Icon(
                      Icons.battery_full,
                      color: Colors.white,
                      size: 19,
                    ),
                  ],
                ),
              ],
            ),
          ),

          // AppBar
          Container(
            width: double.infinity,
            height: 52,
            color: const Color(0xFF304878),
            padding: const EdgeInsets.all(14),
            child: const Text(
              'Bảng điểm lớp',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Nội dung chính
          Expanded(
            child: SingleChildScrollView(     //cho phép cuộn mh lên xuống
              child: Column(
                children: [
                  // Bảng thống kê
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.all(14),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: const Color(0xFF304878),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Điểm trung bình lớp',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          diemTrungBinh.toStringAsFixed(2),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Divider(color: Colors.white24),
                        const SizedBox(height: 5),

                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          children: [
                            thongKe('Giỏi', '$soGioi'),
                            thongKe(
                              'Chưa có điểm',
                              '$soChuaCoDiem',
                            ),
                            thongKe(
                              'Cao nhất',
                              diemCaoNhat.toStringAsFixed(1),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Tiêu đề danh sách
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(
                      left: 14,
                      bottom: 8,
                    ),
                    child: Text(
                      'DANH SÁCH · ${danhSach.length} SINH VIÊN',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  // Hiển thị sinh viên bằng for
                  for (Student sv in danhSach)
                    Container(
                      margin: const EdgeInsets.only(
                        left: 14,
                        right: 14,
                        bottom: 8,
                      ),
                      padding: const EdgeInsets.all(13),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: const Color(0xFFE8E8E8),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Text(
                                sv.name,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                xepLoai(sv.score),
                                style: TextStyle(
                                  fontSize: 12,
                                  color: mauXepLoai(sv.score),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            sv.score == null
                                ? '—'
                                : sv.score!.toStringAsFixed(1),
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),

          // Thanh điều hướng dưới điện thoại
          Container(
            height: 25,
            alignment: Alignment.center,
            child: Container(
              width: 100,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget thống kê
  Widget thongKe(String ten, String giaTri) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ten,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 11,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          giaTri,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

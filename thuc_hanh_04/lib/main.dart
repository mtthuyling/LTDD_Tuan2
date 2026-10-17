
import 'package:flutter/material.dart';

// 1. Tạo class Student
class Student {
  String name;
  String? email;
  String? phone;

  Student({
    required this.name,
    this.email,
    this.phone,
  });
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const StudentScreen(),
    );
  }
}

class StudentScreen extends StatelessWidget {
  const StudentScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // 2. Tạo danh sách 5 sinh viên
    List<Student> students = [
      Student(
        name: "Mai Thị Thùy Linh",
        email: "linhmtt3714@ut.edu.vn",
        phone: "0999 999 999",
      ),
      Student(
        name: "Nguyễn Duy Ngọc",
        email: null,
        phone: "0123 456 789",
      ),
      Student(
        name: "Phạm Nguyễn Hoài Linh",
        email: "linhpnh@ut.edu.vn",
        phone: null,
      ),
      Student(
        name: "Phạm Quốc Dũng",
        email: null,
        phone: null,
      ),
      Student(
        name: "Võ Thanh Em",
        email: "em@sv.edu.vn",
        phone: "0933 111 222",
      ),
    ];

    // 3. Đếm số sinh viên thiếu email
    int missingEmail = 0;

    for (int i = 0; i < students.length; i++) {
      if (students[i].email == null) {
        missingEmail++;
      }
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5FA),

      appBar: AppBar(
        title: const Text(
          "Danh sách sinh viên",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        backgroundColor: const Color(0xFF304675),
      ),

      body: Center(
        child: SizedBox(
          width: 400,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [

              // 4. Dùng for tạo các thẻ sinh viên
              for (int i = 0; i < students.length; i++)
                Container(
                  margin: const EdgeInsets.only(bottom: 10),// tạo khoảng cách 10px phía duới, margin là bên ngoài
                  padding: const EdgeInsets.all(14),// tạo khoảng cách 14px bên trong, padding là bên trong

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color(0xFFE5E5E5),
                    ),
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        students[i].name,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 5),

                      Row(
                        children: [
                          const Text(
                            "Email: ",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                            ),
                          ),

                          Text(
                            students[i].email ?? "Chưa cập nhật",
                            style: TextStyle(
                              fontSize: 13,
                              color: students[i].email == null
                                  ? Colors.red
                                  : Colors.grey,
                              fontStyle: students[i].email == null
                                  ? FontStyle.italic
                                  : FontStyle.normal,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 3),

                      Row(
                        children: [
                          const Text(
                            "SĐT: ",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                            ),
                          ),

                          Text(
                            students[i].phone ?? "Chưa cập nhật",
                            style: TextStyle(
                              fontSize: 13,
                              color: students[i].phone == null
                                  ? Colors.red
                                  : Colors.grey,
                              fontStyle: students[i].phone == null
                                  ? FontStyle.italic
                                  : FontStyle.normal,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

              // 5. Thanh thống kê cuối danh sách
              Container(
                padding: const EdgeInsets.all(14),

                decoration: BoxDecoration(
                  color: const Color(0xFFE5EBF4),
                  borderRadius: BorderRadius.circular(10),
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Tổng: ${students.length} sinh viên",
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF304675),
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      "Thiếu email: $missingEmail",
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.red,
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
    );
  }
}


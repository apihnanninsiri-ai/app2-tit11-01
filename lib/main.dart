
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
      title: 'My Social Profile',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool isFollowing = false;

  // รูปภาพโพสต์ 3 ภาพจากอินเทอร์เน็ต
  final List<String> images = [
    'https://images.unsplash.com/photo-1470770841072-f978cf4d019e?w=500',
    'https://images.unsplash.com/photo-1441974231531-c6227db76b6e?w=500',
    'https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?w=500',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // ส่วนหัว AppBar
      appBar: AppBar(
        title: const Text(
          'my_social_profile',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('เมนู'),
                ),
              );
            },
            icon: const Icon(Icons.menu),
          ),
        ],
      ),

      // ส่วนแสดงเนื้อหาหน้าจอ
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // 1. ส่วนรูปโปรไฟล์และจำนวนสถิติ
              Row(
                children: [

                  // รูปโปรไฟล์จาก Assets
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey.shade300,
                    child: ClipOval(
                      child: Image.asset(
                        'assets/6931822183044 (1).jpg',
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Icons.person,
                            size: 50,
                            color: Colors.grey,
                          );
                        },
                      ),
                    ),
                  ),

                  const SizedBox(width: 15),

                  // จำนวนโพสต์ ผู้ติดตาม กำลังติดตาม
                  Expanded(
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceEvenly,
                      children: [

                        buildStat('3', 'โพสต์'),

                        buildStat('1.20M', 'ผู้ติดตาม'),

                        buildStat('800', 'กำลังติดตาม'),

                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              // 2. ชื่อและแคปชั่น
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    'Apihnan Ninsiri',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 5),

                  Text(
                    'นักศึกษาแผนกเทคโนโลยีสารสนเทศ',
                    style: TextStyle(fontSize: 14),
                  ),

                  Text(
                    'หลงใหลในการเขียน Flutter ',
                    style: TextStyle(fontSize: 14),
                  ),

                ],
              ),

              const SizedBox(height: 15),

              // 3. ปุ่มติดตามและปุ่มข้อความ
              Row(
                children: [

                  // ปุ่มติดตามแบบทึบ
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isFollowing = !isFollowing;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        isFollowing ? 'กำลังติดตาม' : 'ติดตาม',
                      ),
                    ),
                  ),

                  const SizedBox(width: 8),

                  // ปุ่มข้อความแบบเส้นขอบ
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('เปิดหน้าข้อความ'),
                          ),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.blue,
                        side: const BorderSide(
                          color: Colors.blue,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text('ข้อความ'),
                    ),
                  ),

                ],
              ),

              const SizedBox(height: 15),

              // 4. แถบไอคอน
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  Icon(
                    Icons.grid_on,
                    size: 28,
                  ),

                  Icon(
                    Icons.person_pin_circle,
                    size: 28,
                    color: Colors.grey,
                  ),

                ],
              ),

              const SizedBox(height: 10),

              // 5. แสดงรูปภาพ 3 ภาพ
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: images.length,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  return Image.network(
                    images[index],
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey.shade300,
                        child: const Icon(Icons.image),
                      );
                    },
                  );
                },
              ),

            ],
          ),
        ),
      ),
    );
  }

  // เมธอดแสดงจำนวนสถิติ
  Widget buildStat(String number, String title) {
    return Column(
      children: [
        Text(
          number,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

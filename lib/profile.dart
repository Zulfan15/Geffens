import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1E6CE), // Added background color
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                color: Color(0xFF35423C), // Changed card color
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Geffens EarthQuake',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Changed text color
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Aplikasi ini dibuat untuk memberikan informasi terbaru '
                        'tentang gempa bumi yang terjadi di Indonesia. Data pada aplikasi '
                        'ini diperoleh dari API resmi BMKG, sehingga pengguna dapat '
                        'mengakses data secara real-time dan akurat.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white, // Changed text color
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Card(
                color: Color(0xFF35423C), // Changed card color
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Tentang Pembuat',
                        style: TextStyle(
                          fontSize: 24, // Adjusted font size
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Changed text color
                        ),
                        ),
                        const SizedBox(height: 16), // Adjusted height
                        Center(
                        child: Image.asset(
                          'assets/images/zulfan.png',
                          width: 100,
                          height: 100,
                        ),
                        ),
                        const SizedBox(height: 16), // Adjusted height
                        const Text(
                        'Nama: Muhammad Zulfan A',
                        style: TextStyle(
                          fontSize: 18, // Adjusted font size
                          color: Colors.white, // Changed text color
                        ),
                        ),
                        const SizedBox(height: 16), // Adjusted height
                        const Text(
                        'NRP: 152022243',
                        style: TextStyle(
                          fontSize: 18, // Adjusted font size
                          color: Colors.white, // Changed text color
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

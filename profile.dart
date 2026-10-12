import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String username;

  // Kode member contoh, silakan ganti dengan data asli
  final String kodeMember;

  const ProfilePage({
    super.key,
    this.username = '',
    this.kodeMember = 'TXP-0001',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // [Icons]
              const Center(
                child: CircleAvatar(
                  radius: 55,
                  backgroundColor: Colors.blueAccent,
                  child: Icon(
                    Icons.person_rounded,
                    size: 70,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              // Kode Member: [KODE_MEMBER]
              Text(
                "Kode Member: $kodeMember",
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 8),
              // Nama: (disesuaikan dengan username saat login)
              Text(
                "Nama: ${username.isEmpty ? '-' : username}",
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 32),
              // [Log out] <- pushNamedAndRemoveUntil
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/',
                      (route) => false,
                    );
                  },
                  child: const Text(
                    "Log out",
                    style: TextStyle(fontSize: 16, color: Colors.white),
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
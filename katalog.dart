import 'package:flutter/material.dart';
import 'detailgadget.dart';
import 'gadget.dart';

class CatalogPage extends StatelessWidget {
  final String username;

  const CatalogPage({super.key, this.username = ''});

  // Data contoh, silakan ganti sesuai produkmu
  static const List<Gadget> _items = [
    Gadget(icon: Icons.smartphone_rounded, nama: "Smartphone", harga: 3500000),
    Gadget(icon: Icons.laptop_mac_rounded, nama: "Laptop", harga: 12500000),
    Gadget(icon: Icons.tablet_mac_rounded, nama: "Tablet", harga: 4800000),
    Gadget(icon: Icons.watch_rounded, nama: "Smartwatch", harga: 1900000),
    Gadget(icon: Icons.headphones_rounded, nama: "Headphone", harga: 750000),
    Gadget(icon: Icons.keyboard_rounded, nama: "Keyboard", harga: 450000),
    Gadget(icon: Icons.mouse_rounded, nama: "Mouse", harga: 250000),
    Gadget(icon: Icons.speaker_rounded, nama: "Speaker", harga: 600000),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Katalog"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            if (username.isNotEmpty) ...[
              Text(
                "Halo, $username!",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
            ],
            for (final item in _items) ...[
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetailPage(item: item),
                    ),
                  );
                },
                child: _GadgetCard(item: item),
              ),
              const SizedBox(height: 12),
            ],
          ],
        ),
      ),
    );
  }
}

class _GadgetCard extends StatelessWidget {
  final Gadget item;

  const _GadgetCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Baris 1: [icon] Gadget [NAMA]
            Row(
              children: [
                Icon(item.icon, size: 32, color: Colors.blueAccent),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    "Gadget ${item.nama}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Baris 2: Rp[HARGA]
            Text(
              item.hargaText,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.blueAccent,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
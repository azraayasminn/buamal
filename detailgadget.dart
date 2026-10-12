import 'package:flutter/material.dart';
import 'gadget.dart';
import 'voucher.dart';

class DetailPage extends StatefulWidget {
  final Gadget item;

  const DetailPage({super.key, required this.item});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  String? _selectedVoucher;

  Future<void> _klaimVoucher() async {
    final result = await Navigator.push<String>(
      context,
      MaterialPageRoute(
        builder: (_) => const VoucherPage(),
      ),
    );

    // result null jika user menekan back tanpa memilih
    if (result != null && mounted) {
      setState(() {
        _selectedVoucher = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.item;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Gadget"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // [Icon Produk]
              Center(
                child: Icon(item.icon, size: 120, color: Colors.blueAccent),
              ),
              const SizedBox(height: 32),
              // Nama: Gadget [NAMA]
              Text(
                "Nama: Gadget ${item.nama}",
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 8),
              // Harga: Rp [HARGA]
              Text(
                "Harga: ${item.hargaText}",
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 8),
              // Voucher: [Voucher Terpilih/-]
              Text(
                "Voucher: ${_selectedVoucher ?? '-'}",
                style: const TextStyle(fontSize: 18),
              ),
              const Spacer(),
              // [Klaim Voucher Diskon] <- await Navigator.push
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
                  onPressed: _klaimVoucher,
                  child: const Text(
                    "Klaim Voucher Diskon",
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
import 'package:flutter/material.dart';

class VoucherPage extends StatelessWidget {
  const VoucherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Voucher"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Pilih diskon voucher anda:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 16),
              _VoucherOption(
                label: "Diskon 10%",
                onTap: () => Navigator.pop(context, 'Diskon 10%'),
              ),
              const SizedBox(height: 12),
              _VoucherOption(
                label: "Diskon 20%",
                onTap: () => Navigator.pop(context, 'Diskon 20%'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _VoucherOption extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _VoucherOption({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: const Icon(Icons.local_offer_rounded, color: Colors.blueAccent),
        title: Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        onTap: onTap,
      ),
    );
  }
}
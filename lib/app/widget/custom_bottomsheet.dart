import 'package:flutter/material.dart';

class CustomBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildBottomSheetItem(Icons.home, 'Beranda', Colors.black),
              _buildBottomSheetItem(Icons.search, 'Cari', Colors.black),
              _buildBottomSheetItem(Icons.shopping_cart, 'Keranjang', Colors.black),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildBottomSheetItem(Icons.list, 'Daftar Transaksi', Colors.black),
              _buildBottomSheetItem(Icons.card_giftcard, 'Voucher Saya', Colors.black),
              _buildBottomSheetItem(Icons.location_on, 'Alamat Pengiriman', Colors.black),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildBottomSheetItem(Icons.people, 'Daftar Teman', Colors.black),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottomSheetItem(IconData icon, String label, Color iconColor) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 30, color: iconColor),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(color: Colors.black)),
      ],
    );
  }
}

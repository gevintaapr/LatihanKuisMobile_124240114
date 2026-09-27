import 'package:flutter/material.dart';
import '../models/bookModels.dart';

class Detail extends StatelessWidget {
  final BookModel book;

  const Detail({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Buku"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar Sampul Buku dengan Efek Shadow & Rounded Corner
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    book.imageUrl,
                    height: 250,
                    width: 170,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        Container(
                          height: 250,
                          width: 170,
                          color: Colors.grey[300],
                          child: const Icon(Icons.broken_image, size: 50, color: Colors.grey),
                        ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Judul Buku & Penulis
            Center(
              child: Column(
                children: [
                  Text(
                    book.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Penulis: ${book.author}",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Badge Info Singkat (Rating, Genre, Halaman, Tahun)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildInfoChip(Icons.star, Colors.amber, "${book.rating}"),
                _buildInfoChip(Icons.category, Colors.blue, book.genre),
                _buildInfoChip(Icons.auto_stories, Colors.green, "${book.pages} hlm"),
                _buildInfoChip(Icons.calendar_today, Colors.orange, "${book.year}"),
              ],
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 10),

            // Informasi Detail Tambahan (Penerbit, Link URL)
            Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  children: [
                    _buildInfoRow(Icons.business, "Penerbit", book.publisher),
                    const Divider(height: 16),
                    _buildInfoRow(Icons.link, "URL Buku", book.bookUrl),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Deskripsi Buku
            const Text(
              "Deskripsi Buku",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              book.description,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                fontSize: 14,
                height: 1.5,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  // Helper widget untuk Chip Info Singkat
  Widget _buildInfoChip(IconData icon, Color color, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // Helper widget untuk Info Row di Card
  Widget _buildInfoRow(IconData icon, String title, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: Colors.grey[600]),
        const SizedBox(width: 10),
        SizedBox(
          width: 80,
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
          ),
        ),
        const Text(": "),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

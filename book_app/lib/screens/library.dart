import 'package:flutter/material.dart';

import '../models/bookModels.dart';

//StatefulWidget digunakan ketika halaman tersebut memiliki State (data atau tampilan UI yang bisa berubah-ubah/dinamis selama aplikasi berjalan, seperti list data, form input, atau nilai yang di-update dengan setState

// Widget Class
class Library extends StatefulWidget {
  final String username; // Variabel ini menampung data nama pengguna yang dikirim/diteruskan saat halaman Home dipanggi

  const Library({super.key, required this.username});

  @override
  State<Library> createState() => _LibraryState();

  //Fungsi ini bertugas menghubungkan widget Home dengan class State-nya (yaitu _HomeState). Di dalam class _LibraryState itulah tempat kita menuliskan logika UI, pengolahan data, dan fungsi build()
}

class _LibraryState extends State<Library> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        padding: EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio:
              0.8, // Semakin kecil nilainya, card semakin memanjang ke bawah
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: bookList.length,
        // itemBuilder: (context, index) {
        // final book = books[index];

        // return Card(
        //   child: Text(book.title),
        // );
        itemBuilder: (context, index) {
          final book = bookList[index];

          return Card(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize:
                      MainAxisSize.min, // biar ngikutin ukuran kontennya,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 280,
                      width: 200,
                      child: Image.network(
                        book.imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.broken_image, size: 40),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(book.title, textAlign: TextAlign.center,),
                    Text(book.author, textAlign: TextAlign.center),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
    // appBar: AppBar
    // return ListView.builder( //listView builder itu untuk mengenerate data yang hanya ditampilkan di layar (ini tu kayak penampung daftar komtak untuk di scroll)
    //   itemCount: products.length,
    //   itemBuilder: (context, index) {
    //     final product = products[index];

    //     return ListTile(
    //       leading: Image.network(product.image),
    //       title: Text(product.name),
    //       subtitle: Text("Rp.${product.price}"),
    //       trailing: Icon(Icons.arrow_right_sharp),
    //       onTap: () {
    //         Navigator.push(
    //           // 1. Perintah ke Navigator: "Tumpuk halaman baru ini di atas halaman sekarang"
    //           context,
    //           MaterialPageRoute( // 2. Bungkus halaman tujuan dengan MaterialPageRoute (agar ada animasi & rute resmi)
    //           builder: (context) => Detail(product: product)
    //            // 3. Tentukan halaman tujuannya (yaitu halaman Detail dengan membawa data produk)
    //            )
    //         );
    //       }
    //     );
    //   });
  }
}

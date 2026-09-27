import 'package:flutter/material.dart';
import '../models/bookModels.dart';

class Detail extends StatelessWidget {
  final BookModel book; //karna mau nampilin data product, jadi di class detail ini perlu tipe data Product dengan variavbel product

  const Detail({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Book Detail")),

      body: Center(
        child: SingleChildScrollView(
          child: Column(children: [
            
            Image.network(product.image)
          ],),
        ),
      )
    );
  }
}
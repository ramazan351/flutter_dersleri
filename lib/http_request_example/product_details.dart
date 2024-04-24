import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  int? id;
  String? title;
  String? description;
  String? price;
  String? brand;
  String? category;
  String? thumbnail;
  ProductDetails({
    super.key,
    this.id,
    this.title,
    this.description,
    this.brand,
    this.price,
    this.category,
    this.thumbnail,
  });

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Image(
                  image: NetworkImage('${widget.thumbnail}'),
                ),
                const SizedBox(
                  height: 20,
                ),
                Align(alignment: Alignment.centerLeft, child: Text("Ürün Numarası: ${widget.id}")),
                Align(alignment: Alignment.centerLeft, child: Text("Ürün Adı: ${widget.title}")),
                Align(alignment: Alignment.centerLeft, child: Text("Ürün Markası: ${widget.brand}")),
                Align(alignment: Alignment.centerLeft, child: Text("Ürün Kategorisi: ${widget.category}")),
                Align(alignment: Alignment.centerLeft, child: Text("Ürün Açıklama: ${widget.description}")),
                Align(alignment: Alignment.centerLeft, child: Text("Ürün Fiyatı: ${widget.price}\$ ")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

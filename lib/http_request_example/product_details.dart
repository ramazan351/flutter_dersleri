import 'package:flutter/material.dart';
import 'package:flutter_dersi3/http_request_example/product_model.dart';

class ProductDetails extends StatefulWidget {
  Products? product;
  ProductDetails({super.key, this.product});

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
                  image: NetworkImage('${widget.product!.thumbnail}'),
                ),
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Ürün Resimleri",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 235,
                  child: GridView.builder(
                    itemCount: widget.product!.images!.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 4,
                    ),
                    itemBuilder: (context, index) {
                      return GridTile(
                        child: Image.network(widget.product!.images![index]),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Ürün Detayları",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                DataTable(
                  columnSpacing: 50,
                  dataRowHeight: 60,
                  columns: const [
                    DataColumn(label: Text('Başlık')),
                    DataColumn(label: Text('Özellik')),
                  ],
                  rows: [
                    DataRow(cells: [
                      const DataCell(Text('Ürün Numarası')),
                      DataCell(Text('${widget.product!.id}')),
                    ]),
                    DataRow(cells: [
                      const DataCell(Text('Ürün Adı')),
                      DataCell(Text('${widget.product!.title}')),
                    ]),
                    DataRow(cells: [
                      const DataCell(
                        Text('Ürün Markası'),
                      ),
                      DataCell(Text('${widget.product!.brand}')),
                    ]),
                    DataRow(cells: [
                      const DataCell(Text('Ürün Kategorisi')),
                      DataCell(Text('${widget.product!.category}')),
                    ]),
                    DataRow(cells: [
                      const DataCell(Text('Ürün Açıklama')),
                      DataCell(Text('${widget.product!.description}')),
                    ]),
                    DataRow(cells: [
                      const DataCell(Text('Ürün Fiyatı')),
                      DataCell(Text(' ${widget.product!.price}\$')),
                    ]),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

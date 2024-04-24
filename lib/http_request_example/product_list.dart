import 'package:flutter/material.dart';
import 'package:flutter_dersi3/http_request_example/product_details.dart';
import 'package:flutter_dersi3/http_request_example/product_model.dart';
import 'package:flutter_dersi3/http_request_example/product_service.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  ProductService productService = ProductService();
  TextEditingController searchController = TextEditingController();
  List<Products> searchList = [];
  List<Products> productList = [];

  getProductList() async {
    productService.getProductList().then((value) {
      if (value != null) {
        setState(
          () {
            productList = value.products ?? [];
          },
        );
      }
    });
  }

  @override
  void initState() {
    getProductList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Http"),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          setState(() {
            searchController.text = "";
            searchFunc("");
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              TextField(
                controller: searchController,
                textInputAction: TextInputAction.search,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 6.0),
                  labelText: "Ürün Ara",
                  hintText: "Ürün Adı",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    searchFunc(value);
                  });
                },
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: searchList.isNotEmpty == true ? searchList.length : productList.length,
                  itemBuilder: (context, index) {
                    var item =
                        searchList.isNotEmpty == true ? (index < searchList.length ? searchList[index] : productList[index]) : productList[index];

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetails(
                                product: item,
                              ),
                            ));
                      },
                      child: ListTile(
                          leading: Image(
                            image: NetworkImage(item.thumbnail!),
                            height: 50,
                            width: 50,
                          ),
                          title: Text(item.title!),
                          trailing: IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductDetails(
                                        product: item,
                                      ),
                                    ));
                              },
                              icon: const Icon(Icons.arrow_right))),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void searchFunc(String value) {
    searchList.clear();
    for (var products in productList) {
      if (products.title!.toLowerCase().trim().contains(searchController.text.toLowerCase().trim())) {
        searchList.add(products);
      }
    }
    print("search =>$searchList");
  }
}

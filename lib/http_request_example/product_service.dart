// ignore_for_file: avoid_print
import 'dart:convert';

import 'package:flutter_dersi3/http_request_example/product_model.dart';
import 'package:http/http.dart' as http;

class ProductService {
  Future<ProductModel?> getProductList() async {
    var client = http.Client();
    try {
      var response = await client.get(Uri.parse("https://dummyjson.com/products"));
      return ProductModel.fromJson(json.decode(response.body));
    } catch (e) {
      print(e);
      client.close();
    }
    return null;
  }
}

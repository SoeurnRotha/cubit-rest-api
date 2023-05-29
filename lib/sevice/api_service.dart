import 'dart:convert';

import 'package:cubit_api_test/constrant/constrant.dart';
import 'package:cubit_api_test/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiSevice {
  Future<List<ProductElement>> getProducts() async {
    final response = await http.get(Uri.parse('$baseUrl$products'));
    try {
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body) as Map<String, dynamic>;
        final productList = jsonData['products'] as List<dynamic>;
        final products = productList
            .map((productJson) => ProductElement.fromJson(productJson))
            .toList();
        return products;
      } else {
        throw Exception('Error products!');
      }
    } catch (e) {
      throw 'Error products $e';
    }
  }
}

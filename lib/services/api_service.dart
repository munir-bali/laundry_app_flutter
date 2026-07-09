import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:laundry_app_flutter/models/order_model.dart';

class ApiService {
  static const String _productsUrl =
      'https://dummyjson.com/products';

  Future<List<OrderModel>> fetchOrders() async {
    final response = await http.get(
      Uri.parse(_productsUrl),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to fetch orders');
    }

    final Map<String, dynamic> data =
        jsonDecode(response.body);
    final List products = data['products'] ?? [];

    return products
        .map(
          (product) => OrderModel.fromJson(
            product,
          ),
        )
        .toList();
  }
}

import 'package:flutter/foundation.dart';
import 'package:laundry_app_flutter/models/order_model.dart';
import 'package:laundry_app_flutter/services/api_service.dart';

class OrderProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  List<OrderModel> orders = [];
  bool loading = false;
  String? error;

  Future<void> fetchOrders() async {
    loading = true;
    error = null;
    notifyListeners();

    try {
      orders = await _apiService.fetchOrders();
    } catch (_) {
      error = 'Gagal mengambil data.';
      orders = [];
    }

    loading = false;
    notifyListeners();
  }
}

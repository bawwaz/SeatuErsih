import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:seatu_ersih/app/api/api_endpoint.dart';

class OrderStatuscontroller extends GetxController {
  final orders = <Map<dynamic, dynamic>>[].obs;
  final box = GetStorage();
  var isLoading = false.obs;

  @override
  void onInit() {
    fetchOrderCompleted();
    fetchOrderPending();
    fetchOrderInprogress();
    fetchOrderDeclined();
    super.onInit();
  }

  Future<void> fetchOrderPending() async {
    if (isClosed) return;
    isLoading(true);
    final url = ApiEndpoint.baseUrl;
    final token = box.read('token');
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    try {
      orders.clear();
      final response = await http
          .get(Uri.parse('$url/order/status/user/pending'), headers: headers);

      if (response.statusCode == 200) {
        print(response.statusCode);
        final data = json.decode(response.body)['data'];

        if (data != null && data is Iterable) {
          List<Map<dynamic, dynamic>> sortedData =
              data.map<Map<dynamic, dynamic>>((item) {
            return item as Map<dynamic, dynamic>;
          }).toList();

          sortedData.sort((a, b) {
            DateTime dateA = DateTime.parse(a['created_at']);
            DateTime dateB = DateTime.parse(b['created_at']);
            return dateB.compareTo(dateA);
          });

          orders.assignAll(
              sortedData); // assignAll sekarang menerima tipe yang sesuai
        } else {
          isLoading(false);
          print('No orders found in response');
        }
      } else {
        print('Failed to fetch orders: ${response.statusCode}');
        print('Response body: ${response.body}');
        throw Exception('Failed to fetch orders');
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }

  Future<void> fetchOrderWaitingForPayment() async {
    if (isClosed) return;
    isLoading(true);
    final url = ApiEndpoint.baseUrl;
    final token = box.read('token');
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    try {
      orders.clear();
      final response = await http.get(
          Uri.parse('$url/order/status/user/waiting_for_payment'),
          headers: headers);

      if (response.statusCode == 200) {
        final data = json.decode(response.body)['data'];

        if (data != null && data is Iterable) {
          List<Map<dynamic, dynamic>> sortedData =
              data.map<Map<dynamic, dynamic>>((item) {
            return item as Map<dynamic, dynamic>;
          }).toList();

          sortedData.sort((a, b) {
            DateTime dateA = DateTime.parse(a['created_at']);
            DateTime dateB = DateTime.parse(b['created_at']);
            return dateB.compareTo(dateA);
          });

          orders.assignAll(
              sortedData); // assignAll sekarang menerima tipe yang sesuai
        } else {
          print('No orders found in response');
        }
      } else {
        print('Failed to fetch orders: ${response.statusCode}');
        print('Response body: ${response.body}');
        throw Exception('Failed to fetch orders');
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }

  Future<void> fetchOrderInprogress() async {
    if (isClosed) return;
    isLoading(true);
    final url = ApiEndpoint.baseUrl;
    final token = box.read('token');
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    try {
      orders.clear();
      final response = await http.get(
          Uri.parse('$url/order/status/user/In-progress'),
          headers: headers);

      if (response.statusCode == 200) {
        final data = json.decode(response.body)['data'];

        if (data != null && data is Iterable) {
          List<Map<dynamic, dynamic>> sortedData =
              data.map<Map<dynamic, dynamic>>((item) {
            return item as Map<dynamic, dynamic>;
          }).toList();

          sortedData.sort((a, b) {
            DateTime dateA = DateTime.parse(a['created_at']);
            DateTime dateB = DateTime.parse(b['created_at']);
            return dateB.compareTo(dateA);
          });

          orders.assignAll(
              sortedData); // assignAll sekarang menerima tipe yang sesuai
        } else {
          print('No orders found in response');
        }
      } else {
        print('Failed to fetch orders: ${response.statusCode}');
        print('Response body: ${response.body}');
        throw Exception('Failed to fetch orders');
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }

  Future<void> fetchOrderCompleted() async {
    if (isClosed) return;
    isLoading(true);
    final url = ApiEndpoint.baseUrl;
    final token = box.read('token');
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    try {
      orders.clear();
      final response = await http
          .get(Uri.parse('$url/order/status/user/completed'), headers: headers);

      if (response.statusCode == 200) {
        final data = json.decode(response.body)['data'];

        if (data != null && data is Iterable) {
          List<Map<dynamic, dynamic>> sortedData =
              data.map<Map<dynamic, dynamic>>((item) {
            return item as Map<dynamic, dynamic>;
          }).toList();

          sortedData.sort((a, b) {
            DateTime dateA = DateTime.parse(a['created_at']);
            DateTime dateB = DateTime.parse(b['created_at']);
            return dateB.compareTo(dateA);
          });

          orders.assignAll(
              sortedData); // assignAll sekarang menerima tipe yang sesuai
        } else {
          print('No orders found in response');
        }
      } else {
        print('Failed to fetch orders: ${response.statusCode}');
        print('Response body: ${response.body}');
        throw Exception('Failed to fetch orders');
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }

  Future<void> fetchOrderDeclined() async {
    if (isClosed) return;
    isLoading(true);
    final url = ApiEndpoint.baseUrl;
    final token = box.read('token');
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    try {
      orders.clear();
      final response = await http
          .get(Uri.parse('$url/order/status/user/decline'), headers: headers);

      if (response.statusCode == 200) {
        final data = json.decode(response.body)['data'];

        if (data != null && data is Iterable) {
          List<Map<dynamic, dynamic>> sortedData =
              data.map<Map<dynamic, dynamic>>((item) {
            return item as Map<dynamic, dynamic>;
          }).toList();

          sortedData.sort((a, b) {
            DateTime dateA = DateTime.parse(a['created_at']);
            DateTime dateB = DateTime.parse(b['created_at']);
            return dateB.compareTo(dateA);
          });

          orders.assignAll(
              sortedData); // assignAll sekarang menerima tipe yang sesuai
        } else {
          print('No orders found in response');
        }
      } else {
        print('Failed to fetch orders: ${response.statusCode}');
        print('Response body: ${response.body}');
        throw Exception('Failed to fetch orders');
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }
}

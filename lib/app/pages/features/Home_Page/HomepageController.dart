import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class HomePageController extends GetxController {
  var isLoading = false.obs;
  final orders = [].obs;
  final reviews1 = [].obs;
  final reviews2 = [].obs;

  final box = GetStorage();

  Future<void> fetchOrder() async {
    if (isClosed) return; // Ensure the controller is still active
    isLoading.value = true;
    final url = 'http://seatuersih.pradiptaahmad.tech/api';
    final token = box.read('token');
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    try {
      final response =
          await http.get(Uri.parse('$url/order/getall'), headers: headers);

      if (response.statusCode == 200) {
        final data = json.decode(response.body)['data'];
        if (data != null && data is Iterable) {
          List<dynamic> sortedData = data.toList();
          sortedData.sort((a, b) {
            DateTime dateA = DateTime.parse(a['created_at']);
            DateTime dateB = DateTime.parse(b['created_at']);
            return dateB.compareTo(dateA);
          });
          orders.assignAll(sortedData);
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
      isLoading.value = false; // Set loading to false in finally block
    }
  }

  String formatDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    String formattedDate = "${dateTime.day}/${dateTime.month}/${dateTime.year}";
    return formattedDate;
  }

  String formatPrice(String? price) {
    if (price == null) {
      return 'N/A';
    } else {
      int intPrice = int.tryParse(price) ?? 0;
      String formattedPrice =
          NumberFormat.currency(locale: 'id_ID', symbol: 'Rp').format(intPrice);
      return formattedPrice;
    }
  }

  Future<void> fetchReviews1() async {
    if (isClosed) return; // Ensure the controller is still active
    isLoading.value = true;
    final url = 'http://seatuersih.pradiptaahmad.tech/api';
    final token = box.read('token');
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    try {
      final response =
          await http.get(Uri.parse('$url/review/all/1'), headers: headers);

      if (response.statusCode == 200) {
        final data = json.decode(response.body)['reviews'];
        if (data != null && data is Iterable) {
          reviews1.assignAll(data);
        } else {
          print('No reviews found in response');
        }
      } else {
        print('Failed to fetch reviews: ${response.statusCode}');
        print('Response body: ${response.body}');
        throw Exception('Failed to fetch reviews');
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false; // Set loading to false in finally block
    }
  }

  Future<void> fetchReviews2() async {
    if (isClosed) return; // Ensure the controller is still active
    isLoading.value = true;
    final url = 'http://seatuersih.pradiptaahmad.tech/api';
    final token = box.read('token');
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    try {
      final response =
          await http.get(Uri.parse('$url/review/all/2'), headers: headers);

      if (response.statusCode == 200) {
        final data = json.decode(response.body)['reviews'];
        if (data != null && data is Iterable) {
          reviews2.assignAll(data);
        } else {
          print('No reviews found in response');
        }
      } else {
        print('Failed to fetch reviews: ${response.statusCode}');
        print('Response body: ${response.body}');
        throw Exception('Failed to fetch reviews');
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false; // Set loading to false in finally block
    }
  }

  Future<void> refreshOrders() async {
    await fetchOrder();
  }

  @override
  void onInit() async {
    await fetchOrder();
    await fetchReviews1();
    await fetchReviews2();
    super.onInit();
  }

  @override
  void onReady() {
    fetchReviews1();
    fetchReviews2();
    super.onReady();
  }
}

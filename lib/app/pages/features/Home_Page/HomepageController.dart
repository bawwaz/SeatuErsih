import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:seatu_ersih/app/api/api_endpoint.dart';
import 'package:seatu_ersih/app/router/app_pages.dart';

class HomePageController extends GetxController {
  var isLoading = false.obs;
  final orders = <Map<dynamic, dynamic>>[].obs;
  final isStoreOpen = true.obs;
  final reviews1 = [].obs;
  final reviews2 = [].obs;

  final box = GetStorage();

  Future<void> fetchOrder() async {
    if (isClosed) return;
    isLoading(true);
    final url = ApiEndpoint.baseUrl;
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
          List<Map<dynamic, dynamic>> sortedData =
              data.map<Map<dynamic, dynamic>>((item) {
            return item as Map<dynamic, dynamic>;
          }).toList();

          sortedData.sort((a, b) {
            DateTime dateA = DateTime.parse(a['created_at']);
            DateTime dateB = DateTime.parse(b['created_at']);
            return dateB.compareTo(dateA);
          });

          orders.assignAll(sortedData); // Update orders list with new data

          // Print the fetched data for debugging purposes
          print('Fetched Orders:');
          for (var order in sortedData) {
            print(order);
          }
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
      Get.forceAppUpdate(); // Force a full app update to refresh UI
    }
  }

  Future<void> refreshOrders() async {
    await fetchOrder(); // Fetch new orders and update the list
  }

  @override
  void onInit() async {
    super.onInit();
    await fetchOrder();
  }

  Future<void> fetchReviews1() async {
    isLoading(true);
    final url = ApiEndpoint.baseUrl;
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
      isLoading(false);
    }
  }

  Future<void> fetchReviews2() async {
    isLoading(true);
    final url = ApiEndpoint.baseUrl;
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
      isLoading(false);
    }
  }

  Future<void> forceReloadPage() async {
    // Navigate back and then to the same page
    await Get.offNamedUntil(Routes.BTMNAVBAR, (route) => false);
    await Future.delayed(
        Duration(milliseconds: 100)); // Small delay to ensure navigation
    await Get.toNamed(Routes.BTMNAVBAR);
  }

  String formatDate(String date) {
    DateTime dateTime = DateTime.parse(date);

    return DateFormat('d MMMM y').format(dateTime);
  }

  String formatPrice(String? price) {
    if (price == null) {
      return 'N/A';
    } else {
      int intPrice = int.tryParse(price) ?? 0;
      return NumberFormat.currency(locale: 'id_ID', symbol: 'Rp')
          .format(intPrice);
    }
  }
}

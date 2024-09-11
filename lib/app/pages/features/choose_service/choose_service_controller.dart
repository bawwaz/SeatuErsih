import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:seatu_ersih/app/api/api_endpoint.dart';

class ChooseServiceController extends GetxController {
  var laundries = <Map<String, dynamic>>[].obs;
  var averageRating = <double>[].obs;
  var isLoading = false.obs;
  var isStoreOpen = true.obs;
  var totalOrder1 = 0.obs; // Observable for Regular Clean
  var totalOrder2 = 0.obs; // Observable for Deep Clean
  var base_price = 0.obs;

  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    fetchShopStatus();
    fetchPrice("Regular Clean");
    fetchPrice("Deep Clean");
    fetchTotalOrders();
    fetchLaundries();
  }

  Future<void> fetchTotalOrders() async {
    await Future.wait([fetchTotalOrder1(), fetchTotalOrder2()]);
  }

  // Fetch total regular clean orders
  Future<void> fetchTotalOrder1() async {
    final url = ApiEndpoint.baseUrl + '/order/total/regular_clean';
    final token = box.read('token');

    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      final response = await http.get(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data.containsKey('data') &&
            data['data'].containsKey('regular_clean')) {
          totalOrder1.value =
              data['data']['regular_clean']; // Update observable
          print("Total Regular Clean Orders: ${totalOrder1.value}");
        } else {
          print("Unexpected response structure: ${response.body}");
        }
      } else {
        print(
            'Failed to fetch total orders for regular clean: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching total orders: $e');
    }
  }

  // Fetch total deep clean orders
  Future<void> fetchTotalOrder2() async {
    final url = ApiEndpoint.baseUrl + '/order/total/deep_clean';
    final token = box.read('token');

    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      final response = await http.get(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data.containsKey('data') &&
            data['data'].containsKey('deep_clean')) {
          totalOrder2.value = data['data']['deep_clean']; // Update observable
          print("Total Deep Clean Orders: ${totalOrder2.value}");
        } else {
          print("Unexpected response structure: ${response.body}");
        }
      } else {
        print(
            'Failed to fetch total orders for deep clean: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching total orders: $e');
    }
  }

  Future<void> fetchLaundries() async {
    final token = box.read('token');
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      isLoading(true);
      final response = await http.get(
          Uri.parse('http://seatuersih.xyz/api/laundry/getall'),
          headers: headers);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['laundries'] != null && data['laundries'] is List) {
          laundries.value = List<Map<String, dynamic>>.from(data['laundries']);
        } else {
          print('Unexpected response structure: ${response.body}');
        }
      } else {
        print('Error fetching laundries: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching laundries: $e');
    } finally {
      isLoading(false);
    }
  }

  Future<void> fetchShopStatus() async {
    print('Fetching shop status...');
    final url = ApiEndpoint.baseUrl;
    final token = box.read('token');
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      final response = await http
          .get(Uri.parse('$url/store-status/status-toko/1'), headers: headers);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data.containsKey('data') && data['data'] != null) {
          final storeData = data['data'];
          isStoreOpen.value = storeData['is_open'] ?? false;
          print(isStoreOpen.value ? 'Store is OPEN' : 'Store is CLOSED');
        } else {
          print('Data object is missing or null');
          isStoreOpen.value = false;
        }
      } else {
        print('Failed to fetch shop status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching shop status: $e');
    }
  }

  Future<void> fetchPrice(String serviceType) async {
    final url = ApiEndpoint.baseUrl;
    final token = box.read('token');

    var headers = {
      "Accept": 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      final response =
          await http.get(Uri.parse('$url/laundry/getall'), headers: headers);

      if (response.statusCode == 200) {
        print('controller successfully initialized');
        final data = json.decode(response.body);
        print('Response data: ${response.body}');

        if (data != null && data['laundries'] != null) {
          print('Success, found laundries');
          print('Service type passed: $serviceType');

          bool priceFound = false;
          String normalizedServiceType = serviceType.toLowerCase().trim();

          for (var laundry in data['laundries']) {
            String laundryName = (laundry['name'] ?? '').trim().toLowerCase();
            print('Laundry name: $laundryName');

            print('Laundry price: ${laundry['price']}');

            if (laundryName.contains(normalizedServiceType)) {
              base_price.value = int.tryParse(laundry['price']) ?? 0;
              priceFound = true;
              print(
                  'Matched laundry: ${laundry['name']} with price: ${laundry['price']}');
              break;
            }
          }

          if (!priceFound) {
            print('No matching laundry service found for type: $serviceType');
          }
        } else {
          print('No laundries found');
        }
      } else {
        print('Failed to fetch price: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Error fetching price: $e');
    }
  }

  Future<void> refreshData() async {
    await fetchShopStatus();
    await fetchTotalOrders();
    await fetchLaundries();
    await fetchPrice("Regular Clean");
    await fetchPrice("Deep Clean");
  }
}

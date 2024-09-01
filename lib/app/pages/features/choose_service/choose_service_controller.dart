import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:seatu_ersih/app/api/api_endpoint.dart';

class ChooseServiceController extends GetxController {
  var laundries = <Map<String, dynamic>>[].obs;
  var average_rating = <double>[].obs;
  var isLoading = false.obs;
  var isStoreOpen = true.obs;
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    print("ChooseServiceController initialized");
    fetchShopStatus();
    fetchLaundries();
  }

  Future<void> fetchLaundries() async {
    final token = box.read('token');

    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      final response = await http.get(
          Uri.parse('http://seatuersih.pradiptaahmad.tech/api/laundry/getall'),
          headers: headers);

      if (response.statusCode == 200) {
        isLoading(true);
        var data = jsonDecode(response.body);
        if (data['laundries'] != null && data['laundries'] is List) {
          laundries.value = List<Map<String, dynamic>>.from(data['laundries']);
          // Fetch and update average ratings
          await fetchAverageReviews();
          isLoading(false);
        }
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> fetchAverageReviews() async {
    isLoading.value = true;
    final url = ApiEndpoint.baseUrl;
    final token = box.read('token');
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    List<double> ratings = List<double>.filled(laundries.length, 0.0);

    try {
      for (var laundry in laundries) {
        final id = laundry["id"];
        final response = await http.get(Uri.parse('$url/review/average/$id'),
            headers: headers);

        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          final rating =
              double.tryParse(data['average_rating'].toString()) ?? 0.0;
          int index = laundries.indexWhere((l) => l["id"] == id);
          if (index != -1) {
            ratings[index] = rating;
          }
        } else {
          print('Failed to fetch reviews for id $id: ${response.statusCode}');
        }
      }
      average_rating.value = ratings;
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> orderLaundry(int laundryId) async {
    final token = box.read('token');
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    print('Memesan laundry dengan id: $laundryId');
    final response = await http.get(
      Uri.parse(
          'http://seatuersih.pradiptaahmad.tech/api/laundry/get/$laundryId'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      print('Sukses: ${response.body}');
      Get.snackbar('Sukses', 'Pesanan Anda telah diterima');
    } else {
      print('Error: ${response.statusCode}');
      print('Isi respon: ${response.body}');
      Get.snackbar('Error', 'Gagal memesan: ${response.statusCode}');
    }
  }

  Future<void> fetchShopStatus() async {
    print('Fetching shop status...');
    final url =
        // 'http://seatuersih.pradiptaahmad.tech/api/store-status/status-toko/1';
        ApiEndpoint.baseUrl;
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
          if (storeData.containsKey('is_open') &&
              storeData['is_open'] != null) {
            isStoreOpen.value = storeData['is_open'] == true;
          } else {
            print('is_open field is missing or null in the data object');
            isStoreOpen.value = false;
          }

          if (isStoreOpen.value) {
            print('Store is OPEN');
          } else {
            print('Store is CLOSED');
          }
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

  Future<void> refreshData() async {
    await fetchShopStatus();
    await fetchLaundries();
  }
}

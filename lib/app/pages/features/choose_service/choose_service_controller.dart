import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class ChooseServiceController extends GetxController {
  var laundries = <Map<String, dynamic>>[].obs;
  var average_rating = <double>[].obs; // Explicitly typed as RxList<double>
  var isLoading = false.obs;
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
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
        var data = jsonDecode(response.body);
        if (data['laundries'] != null && data['laundries'] is List) {
          laundries.value = List<Map<String, dynamic>>.from(data['laundries']);

          // Fetch and update average ratings
          await fetchAverageReviews();
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
    final url = 'http://seatuersih.pradiptaahmad.tech/api';
    final token = box.read('token');
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    // Initialize the ratings list
    List<double> ratings = List<double>.filled(laundries.length, 0.0);

    try {
      for (var laundry in laundries) {
        final id = laundry["id"];
        final response = await http.get(
            Uri.parse('$url/review/average/$id'),
            headers: headers);

        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          final rating = double.tryParse(data['average_rating'].toString()) ?? 0.0;
          int index = laundries.indexWhere((l) => l["id"] == id);
          if (index != -1) {
            ratings[index] = rating;
          }
        } else {
          print('Failed to fetch reviews for id $id: ${response.statusCode}');
        }
      }
      average_rating.value = ratings; // Update the average_rating list
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
      // Penanganan sukses
      print('Sukses: ${response.body}');
      Get.snackbar('Sukses', 'Pesanan Anda telah diterima');
    } else {
      // Penanganan error
      print('Error: ${response.statusCode}');
      print('Isi respon: ${response.body}');
      Get.snackbar('Error', 'Gagal memesan: ${response.statusCode}');
    }
  }
}

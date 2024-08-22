import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class MyShoeController extends GetxController {
  var isLoading = false.obs;
  final box = GetStorage();

  Future<void> fetchShoebyId() async {
    isLoading.value = true;
    final url = 'http://seatuersih.pradiptaahmad.tech/api';
    final token = box.read('token');

    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    // try {
    // final response =
    // await http.get(Uri.parse('$url/shoe/getshoe/'), headers: headers);

    // if (response.statusCode == 200) {

    // }
    // }
  }
}

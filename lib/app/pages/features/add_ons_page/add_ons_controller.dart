import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class AddOnsController extends GetxController {
  late final arguments;
  final brand = <Map<String, dynamic>>[].obs;
  var orderId = 0.obs;
  List<dynamic> addOnsData = [
    {
      'title': 'Un-Yellowing - 5k',
      'description': 'Memutihkan sol bawah yang menguning',
      'price': 5000
    },
    {
      'title': 'Base Repaint - 20K',
      'description': 'Cat ulang warna dasar sepatu',
      'price': 20000
    },
    {
      'title': 'Compound - 5K',
      'description': 'Menutup lubang kulit mengelupas',
      'price': 5000
    },
  ];
  final total_price = 0.obs;
  final box = GetStorage();

  var shoesName = "".obs;
  var shoesNote = "".obs;
  var isOtherSelected = false.obs;

  List<dynamic> selectedAddOns = [].obs;
  List<dynamic> nameSelectedAddons = [].obs;

  RxList<RxBool?>? isSelected;

  void addAddOns(dynamic addOns, dynamic nameAddOns) {
    selectedAddOns.add(addOns);
    nameSelectedAddons.add(nameAddOns);
  }

  void removeAddOns(dynamic addOns, dynamic nameAddOns) {
    selectedAddOns.remove(addOns);
    nameSelectedAddons.remove(addOns);
  }

  void calculateTotal() {
    for (int i = 0; i < selectedAddOns.length; i++) {
      total_price.value += int.parse(selectedAddOns[i].toString());
    }
    print(total_price.value);
  }

  Future<void> postShoes() async {
    final url = 'http://seatuersih.pradiptaahmad.tech/api';
    final token = box.read('token');

    var headers = {
      "Accept": 'application/json',
      'Authorization': 'Bearer $token',
    };

    var body = {
      'brand': shoesName.value.toString(),
      'price': total_price.value.toString(),
      'addons': nameSelectedAddons.join(', '),
      'notes': shoesNote.value.toString(),
      'order_id': box.read('order_id').toString(),
    };

    print(body);
    try {
      final response = await http.post(Uri.parse('$url/shoe/add'),
          headers: headers, body: body);
      if (response.statusCode == 201) {
        print('Shoes added successfully');
      } else {
        print('Failed to add shoes: ${response.statusCode}');
        print('Response body: ${response.body}');
        throw Exception('Failed to add shoes');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> fetchShoename() async {
    final url = "http://seatuersih.pradiptaahmad.tech/api";
    final token = box.read('token');

    var headers = {
      "Accept": 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      final response =
          await http.get(Uri.parse('$url/brand/getall'), headers: headers);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data != null && data['data'] != null) {
          brand.clear();
          for (var item in data['data']) {
            brand.add({
              'id': item['id'],
              'brand': item['brand'],
            });
          }
          print('Brands found: ${brand}');
        } else {
          print('Cannot find brands');
        }
      } else {
        print('Failed to fetch brands: ${response.statusCode}');
        print('Response body: ${response.body}');
        throw Exception('Failed to fetch brands');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() {
    arguments = Get.arguments;
    if (arguments[0].toString() == 'regular_clean') {
      total_price.value = 25000;
    } else {
      total_price.value = 35000;
    }
    isSelected = List.generate(addOnsData.length, (index) => false.obs).obs;
   
    fetchShoename();
    super.onInit();
  }

  void checkShoesName() {
    if (shoesName.value.isEmpty) {
      isOtherSelected.value = false;
    }
  }
}

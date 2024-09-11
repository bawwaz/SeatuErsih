import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:seatu_ersih/app/api/api_endpoint.dart';

class AddOnsController extends GetxController {
  late final arguments;
  final brand = <Map<String, dynamic>>[].obs;
  var orderId = 0.obs;
  var base_price = 0.obs;
  var total_price = 0.obs; // Total price including add-ons

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

  final box = GetStorage();
  var shoesName = "".obs;
  var shoesNote = "".obs;
  var isOtherSelected = false.obs;

  List<dynamic> selectedAddOns = [].obs;
  List<dynamic> nameSelectedAddons = [].obs;
  RxList<RxBool?>? isSelected;

  // Add an add-on
  void addAddOns(dynamic addOns, dynamic nameAddOns) {
    selectedAddOns.add(addOns);
    nameSelectedAddons.add(nameAddOns);
    calculateTotal(); // Recalculate total after adding add-on
  }

  // Remove an add-on
  void removeAddOns(dynamic addOns, dynamic nameAddOns) {
    selectedAddOns.remove(addOns);
    nameSelectedAddons.remove(nameAddOns);
    calculateTotal(); // Recalculate total after removing add-on
  }

  // Calculate total price including base price and selected add-ons
  void calculateTotal() {
    total_price.value = base_price.value;
    for (var addon in selectedAddOns) {
      total_price.value += int.parse(addon.toString());
    }
    print('Total price (after calculation): ${total_price.value}');
  }

  // Post shoe data to the API
  Future<void> postShoes() async {
    final url = ApiEndpoint.baseUrl;
    final token = box.read('token');

    var headers = {
      "Accept": 'application/json',
      'Authorization': 'Bearer $token',
    };

    // Print the total price before submitting the data
    print('Total price being submitted: ${total_price.value}');

    var body = {
      'brand': shoesName.value.toString(),
      'price': total_price.value
          .toString(), // Total price including base price and add-ons
      'addons': nameSelectedAddons.join(', '),
      'notes': shoesNote.value.toString(),
      'order_id': box.read('order_id').toString(),
    };

    print('Body data: $body'); // Debug log for POST body

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

  // Fetch shoe brand names from API
  Future<void> fetchShoename() async {
    final url = ApiEndpoint.baseUrl;
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
              base_price.value =
                  int.tryParse(laundry['price']) ?? 0; 
              priceFound = true;
              print(
                  'Matched laundry: ${laundry['name']} with price: ${laundry['price']}');
              break; 
            }
          }

          if (!priceFound) {
            print('No matching laundry service found for type: $serviceType');
          }

          calculateTotal();
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

  @override
  void onInit() {
    super.onInit();
    arguments = Get.arguments;
    fetchPrice(arguments[0].toString());
    isSelected = List.generate(addOnsData.length, (index) => false.obs).obs;
    fetchShoename();
  }

  void checkShoesName() {
    if (shoesName.value.isEmpty) {
      isOtherSelected.value = false;
    }
  }
}

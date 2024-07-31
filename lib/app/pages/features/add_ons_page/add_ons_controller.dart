import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class AddOnsController extends GetxController {
  late final arguments;
  List<dynamic> addOnsData = [
    {
      'title': 'Un-Yellowing - 5k',
      'description': 'Memutihkan sol bawah yang menguning',
      'price': 5000
    },
    {
      'title': 'Base Repaint - 10K',
      'description': 'Cat ulang warna dasar sepatu',
      'price': 10000
    },
    {
      'title': 'Compound - 5K',
      'description': 'Menutup lubang kulit mengelupas',
      'price': 5000
    },
  ];
  final totalPrice = 0.obs;
  final box = GetStorage();

  // variable
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
    nameSelectedAddons.remove(nameAddOns);
  }

  void calculateTotal() {
    for (int i = 0; i < selectedAddOns.length; i++) {
      totalPrice.value += int.parse(selectedAddOns[i].toString());
    }
    print(totalPrice.value);
  }

  Future<void> postShoes() async {
    final url = 'http://seatuersih.pradiptaahmad.tech/api';
    final token = box.read('token');

    var headers = {
      "Accept": 'application/json',
      'Authorization': 'Bearer $token',
    };

    var body = {
      'name': shoesName.value.toString(),
      'price': totalPrice.value.toString(),
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

  @override
  void onInit() {
    // TODO: implement onInit
    arguments = Get.arguments;
    if (arguments[0].toString() == 'regular_clean') {
      totalPrice.value = 25000;
    } else {
      totalPrice.value = 30000;
    }
    isSelected = List.generate(addOnsData.length, (index) => false.obs).obs;
    super.onInit();
  }

  void checkShoesName() {
    if (shoesName.value.isEmpty) {
      isOtherSelected.value = false;
    }
  }
}


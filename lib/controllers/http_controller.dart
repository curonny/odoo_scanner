import 'dart:convert';
import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:odoo_rpc/odoo_rpc.dart';
import 'package:odoo_scanner/models/product.dart';

class HttpController extends GetxController {
  RxBool loading = false.obs;
  RxString url = ''.obs;
  RxString db = ''.obs;
  RxString user = ''.obs;
  RxString password = ''.obs;
  Rx<Product?> product = Rx<Product?>(null);
  RxBool existProduct = false.obs;
  late OdooClient client;
  late OdooSession session;

  @override
  void onInit() async {
    super.onInit();
    await authenticateUser();
  }

  authenticateUser() async {
    client = OdooClient(url.string);
    session = await client.authenticate(db.value, user.value, password.value);
    print(session);
  }

  fetchProduct(String barcode) async {
    loading.value = true;
    final productSearch = await client.callKw({
      'model': 'product.product',
      'method': 'search_read',
      'args': [],
      'kwargs': {
        'domain': [
          ['barcode', '=', barcode]
        ],
        'fields': ['id', 'name', 'list_price', 'image_128', 'barcode'],
        'limit': 1,
      },
    });
    if (productSearch.length == 1) {
      product.value = Product.fromJson(productSearch[0]);
      existProduct.value = true;
    } else {
      product.value = null;
      existProduct.value = false;
    }
    loading.value = false;
    update();
  }

  changeProduct(Product product) {
    product = product;
    update();
  }

  Uint8List base64ToBytes(String base64String) {
    return base64Decode(base64String);
  }
}

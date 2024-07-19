import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:odoo_scanner/controllers/http_controller.dart';

class BarcodeControllers extends GetxController {
  RxString scanBarcode = ''.obs;
  RxBool scanning = false.obs;
  HttpController httpController = Get.put(HttpController());

  onBarcodeScanner() async {
    scanning.value = true;
    scanBarcode.value = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', 'Cancel', true, ScanMode.BARCODE);
    httpController.fetchProduct(scanBarcode.value);
    scanning.value = false;
    update();
  }
}

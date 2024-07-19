import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:odoo_scanner/widgets/product_card.dart';

import '../controllers/barcode_scanner_controller.dart';
import '../controllers/http_controller.dart';
import '../widgets/app_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BarcodeControllers get barcodeControllers => Get.put(BarcodeControllers());
  HttpController get httpControllers => Get.put(HttpController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text("Barcode scanner"),
      ),
      body: Column(children: [
        Obx(()=>barcodeControllers.scanning.value ? const Center(child:  CircularProgressIndicator()) : Text(barcodeControllers.scanBarcode.value)  ),
        Obx(()=> httpControllers.existProduct.value ? ProductCard(name: httpControllers.product.value!.name, listPrice:  httpControllers.product.value!.listPrice,image128: httpControllers.product.value!.image_128 ?? '',barcode: httpControllers.product.value!.barcode.toString(),) : const SizedBox())
      ],),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          barcodeControllers.onBarcodeScanner();
        },
        backgroundColor: Colors.blueGrey,
        icon: const Icon(Icons.scanner),
        label: const Text('Read code'),
      ),
    );
  }
}

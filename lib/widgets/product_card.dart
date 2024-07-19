import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String? image128;
  final String name;
  final String barcode;
  final double listPrice;
  Uint8List? imageBytes;

  ProductCard(
      {this.image128,
      required this.name,
      required this.barcode,
      required this.listPrice,
      this.imageBytes});

  @override
  Widget build(BuildContext context) {
    bool hasImage = false;
    if (image128!.isNotEmpty) {
      hasImage = true;
      imageBytes = base64ToBytes(image128.toString());
    }

    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (hasImage) Image.memory(imageBytes!),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  barcode,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  '\$${listPrice.toString()}',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 5),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Uint8List base64ToBytes(String base64String) {
    return base64Decode(base64String);
  }
}

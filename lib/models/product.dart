class Product {
  int id;
  String name;
  String barcode;
  double listPrice;
  String? image_128;

  Product({
    required this.id,
    required this.name,
    required this.barcode,
    required this.listPrice,
     this.image_128,
  });

  // Factory constructor para crear una instancia de Product desde un mapa JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      barcode: json['barcode'],
      listPrice: json['list_price'].toDouble(),
      image_128: json['image_128'] is String ? json['image_128'] : null,
    );
  }

  // Método para convertir una instancia de Product a un mapa JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
       'barcode': barcode,
      'list_price': listPrice,
      'image_128': image_128,
    };
  }
}

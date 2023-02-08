import 'dart:convert';

class Product {
  final String name;
  final String description;
  final String quantity;
  final List<String> images;
  final String category;
  final double price;
  final String? id;
  final String? userId;

  Product(this.name, this.description, this.quantity, this.images, this.category, this.price, this.id, this.userId);


  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'quantity': quantity,
      'images': images,
      'category': category,
      'price': price,
      'id': id,
      'userId': userId,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      map['name'] ?? '',
      map['description'] ?? '',
      map['quantity'] ?? '',
      List<String>.from(map['images']),
      map['category'] ?? '',
      map['price']?.toDouble() ?? 0.0,
      map['_id'],
      map['userId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source));
} 

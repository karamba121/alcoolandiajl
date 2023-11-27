import 'package:flutter/material.dart';

class ProductModel {
  ProductModel({
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.details,
    required this.price,
    this.isSlide = false,
  });

  final String imageUrl;
  final String name;
  final String description;
  final String details;
  final double price;
  final bool isSlide;

  ProductModel.fromMap(Map<String, dynamic> map)
      : imageUrl = map['image_url'],
        name = map['name'],
        description = map['description'],
        details = map['details'],
        price = map['price'],
        isSlide = map['is_slide'];
}

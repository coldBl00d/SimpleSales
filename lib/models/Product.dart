import 'package:flutter/material.dart';

class Product {
  final String title, desc;
  final String image;
  final double price;
  final bool isFavorite;
  final String userEmail; 
  final String userId;
  final String id;

  Product({@required this.id,@required this.title, @required this.desc, @required this.price, this.isFavorite = false, this.image, @required this.userId, @required this.userEmail});
}

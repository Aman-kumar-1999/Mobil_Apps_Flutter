// import 'dart:convert';
// import 'dart:html';
//
// import 'package:eqipped_test/BaseUrl.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// class Product {
//   final String productId;
//
//   final String vendorId;
//
//   final DateTime date;
//
//   final String vendorName;
//
//   final String vendorEmail;
//
//   final String productName; // product Type also
//
//   final String productDescription;
//   final String category;
//
//   final String brandName;
//
//   final double productQuantity; // no. of products
//
//   final int individualProductPrice;
//
//   final int TotalProductPrice;
//
//   final int natePriceWithDiscount;
//
//   final int discountPercentage;
//
//   final String status;
//
//   final String action;
//
//   final String imageName;
//
//   final String imagePath;
//
//   final String bulkCode;
//
//   final String variationName;
//
//   final String variationId;
//
//   final int gst;
//
//   final String hsn;
//
//   final String isVerified;
//
//   final String tierNo;
//
//   final String containLiquid;
//
//   Product({
//     required  this.productId,
//
//     required  this.vendorId,
//
//     required  this.date,
//
//     required  this.vendorName,
//
//     required  this.vendorEmail,
//
//     required  this.productName, // product Type also
//
//     required  this.productDescription,
//     required  this.category,
//
//     required  this.brandName,
//
//     required this.productQuantity, // no. of products
//
//     required this.individualProductPrice,
//
//     required this.TotalProductPrice,
//
//     required this.natePriceWithDiscount,
//
//     required this.discountPercentage,
//
//     required  this.status,
//
//     required  this.action,
//
//     required  this.imageName,
//
//     required  this.imagePath,
//
//     required  this.bulkCode,
//
//     required  this.variationName,
//
//     required  this.variationId,
//
//     required this.gst,
//
//     required  this.hsn,
//
//     required  this.isVerified,
//
//     required  this.tierNo,
//
//     required  this.containLiquid,
//   });
// }


import 'package:flutter/material.dart';

class Product {
  final int id;
  final String title, description;
  final List<String> images;
  final List<Color> colors;
  final double rating, price;
  final bool isFavourite, isPopular;

  Product({
    required this.id,
    required this.images,
    required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.title,
    required this.price,
    required this.description,
  });
}

// Our demo Products

List<Product> demoProducts = [
  Product(
    id: 1,
    images: [
      "assets/images/beaker.png",
      "assets/images/Magnifying-Glass-Transparent.png",
      "assets/images/test-tube.png",
      // "assets/images/beaker.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Wireless Controller for PS4™",
    price: 64.99,
    description: description,
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 2,
    images: [
      "assets/images/Magnifying-Glass-Transparent.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Nike Sport White - Man Pant",
    price: 50.5,
    description: description,
    rating: 4.1,
    isPopular: true,
  ),
  Product(
    id: 3,
    images: [
      "assets/images/glap.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Gloves XC Omega - Polygon",
    price: 36.55,
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 4,
    images: [
      "assets/images/wirelessheadset.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Logitech Head",
    price: 20.20,
    description: description,
    rating: 4.1,
    isFavourite: true,
  ),
];





const String description =
    "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";

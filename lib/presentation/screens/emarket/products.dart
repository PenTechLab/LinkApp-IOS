import 'package:flutter/material.dart';




class Product {
  final String image, description;
  final int  size, id;
  final Color color;
  Product({
    this.id,
    this.image,
    // this.title,
    // this.price,
    this.description,
    this.size,
    this.color,
  });
}

List<Product> products = [
  Product(
      id: 1,
      // title: "Office Code",
      // price: 234,
      size: 12,
      description: dummyText,
      image: "assets/images/p_1.jpg",
      color: Color(0xFF3D82AE)),
  Product(
      id: 2,
      // title: "Belt Bag",
      // price: 234,
      size: 8,
      description: dummyText,
      image: "assets/images/p_2.png",
      color: Color(0xFFD3A984)),
  Product(
      id: 3,
      // title: "Hang Top",
      // price: 234,
      size: 10,
      description: dummyText,
      image: "assets/images/p_3.jpeg",
      color: Color(0xFF989493)),
  Product(
      id: 4,
      // title: "Old Fashion",
      // price: 234,
      size: 11,
      description: dummyText,
      image: "assets/images/p_4.jpeg",
      color: Color(0xFFE6B398)),
  Product(
      id: 5,
      // title: "Office Code",
      // price: 234,
      size: 12,
      description: dummyText,
      image: "assets/images/p_5.jpeg",
      color: Color(0xFFFB7883)),
  Product(
    id: 6,
    // title: "Office Code",
    // price: 234,
    size: 12,
    description: dummyText,
    image: "assets/images/p_6.jpeg",
    color: Color(0xFFAEAEAE),
  ),
];

String dummyText =
    "Dum Spiro Spero- As long as I breath, I hope..";

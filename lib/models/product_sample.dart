import 'package:flutter/material.dart';

class Product {
  final List<String> image;
  final String title, description;
  final int price, size, id;
  final Color color;
  Product({
    this.id,
    this.image,
    this.title,
    this.price,
    this.description,
    this.size,
    this.color,
  });
}

List<Product> products = [
  Product(
      id: 1,
      title: "Office Code",
      price: 234,
      size: 12,
      description: dummyText,
      image: [
        "https://p.kindpng.com/picc/s/160-1607364_transparent-herbs-clipart-cosmetic-products-clipart-hd-png.png",
        "https://freepikpsd.com/wp-content/uploads/2019/10/grocery-products-png-Transparent-Images.png",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSybEBBv2N0fLNB4UBSTz6-aO7ItCLaAmqw9A&usqp=CAU",
        "https://794c3afa34486272597f-00a864f9adba2d83ae580aea47304566.ssl.cf1.rackcdn.com/Nivea-Cool-Kick-Shower-Gel.jpg"
      ],
      color: Color(0xFF3D82AE)),
  Product(
      id: 2,
      title: "Belt Bag",
      price: 234,
      size: 8,
      description: dummyText,
      image: [
        "https://794c3afa34486272597f-00a864f9adba2d83ae580aea47304566.ssl.cf1.rackcdn.com/Nivea-Cool-Kick-Shower-Gel.jpg"
      ],
      color: Color(0xFFD3A984)),
  Product(
      id: 3,
      title: "Hang Top",
      price: 234,
      size: 10,
      description: dummyText,
      image: [
        "https://794c3afa34486272597f-00a864f9adba2d83ae580aea47304566.ssl.cf1.rackcdn.com/Nivea-Cool-Kick-Shower-Gel.jpg"
      ],
      color: Color(0xFF989493)),
  Product(
      id: 4,
      title: "Old Fashion",
      price: 234,
      size: 11,
      description: dummyText,
      image: [
        "https://794c3afa34486272597f-00a864f9adba2d83ae580aea47304566.ssl.cf1.rackcdn.com/Nivea-Cool-Kick-Shower-Gel.jpg"
      ],
      color: Color(0xFFE6B398)),
  Product(
      id: 5,
      title: "Office Code",
      price: 234,
      size: 12,
      description: dummyText,
      image: [
        "https://794c3afa34486272597f-00a864f9adba2d83ae580aea47304566.ssl.cf1.rackcdn.com/Nivea-Cool-Kick-Shower-Gel.jpg"
      ],
      color: Color(0xFFFB7883)),
  Product(
    id: 6,
    title: "Office Code",
    price: 234,
    size: 12,
    description: dummyText,
    image: [
      "https://794c3afa34486272597f-00a864f9adba2d83ae580aea47304566.ssl.cf1.rackcdn.com/Nivea-Cool-Kick-Shower-Gel.jpg"
    ],
    color: Color(0xFFAEAEAE),
  ),
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";

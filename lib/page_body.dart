import 'package:flutter/material.dart';

Widget pageBody(String imgUrl, String title, String description) {
  return Column(
    children: [
      Image.network(imgUrl),
      Text(
        title,
        style: TextStyle(
            fontSize: 40, color: Colors.black45, fontWeight: FontWeight.bold),
      ),
      Text(
        description,
        style: TextStyle(fontSize: 20, color: Colors.black26),
      )
    ],
  );
}

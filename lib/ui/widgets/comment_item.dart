import 'package:flutter/material.dart';

import '../../utils/contants.dart';

Container commentItem(index, comments, int i) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(15),
    margin: const EdgeInsets.symmetric(vertical: 10),
    decoration: BoxDecoration(
      color: Constants.newsItemContainerColor,
      borderRadius: BorderRadius.circular(5),
    ),
    child: Column(
      children: [
        Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff171a29),
              ),
              child: Center(
                child: Icon(
                  Icons.person,
                  color: Colors.grey[700],
                  size: 30,
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                comments[index * 5 + i]['name'],
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            )
          ],
        ),
        const SizedBox(height: 20),
        Text(
          comments[index]['body'],
          style: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
        )
      ],
    ),
  );
}

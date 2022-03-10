import 'package:flutter/material.dart';
import 'package:matgar/model/get_category.dart';

Widget getCategory(DataList dataList) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(width: .2, color: Colors.grey),
      borderRadius: BorderRadius.circular(10),
    ),
    height: 120,
    width: 80,
    child: Column(
      children: [
        Image.network(
          '${dataList.image}',
          height: 100,
          width: 70,
        ),
        Expanded(
          child: Opacity(
            opacity: .5,
            child: Container(
              width: double.infinity,
              color: Colors.black,
              child: Center(
                child: Text(
                  '${dataList.name}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}


// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../models/category_model.dart';
import 'image_cached.dart';

class CategoryWidget extends StatelessWidget {
  CategoryModel categoryModel;
  CategoryWidget({
    Key? key,
    required this.categoryModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.symmetric(vertical: 5, horizontal: 4),
      child: Column(
        children: [
          Expanded(child: ImageCached(urlimage:  categoryModel.url!)),
          const SizedBox(
            height: 10,
          ),
          Text(categoryModel.title!)
        ],
      ),
    );
  }
}

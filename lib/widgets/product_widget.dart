// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/cart/bloc/cart_bloc.dart';
import '../blocs/favoraite/bloc/favoraite_bloc.dart';
import '../blocs/product/bloc/product_bloc.dart';
import '../models/product_model.dart';
import 'carousel_image.dart';

class ProductWidget extends StatelessWidget {
  ProductModel productModel;
  ProductWidget({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.grey.withOpacity(0.2),
      ),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: CarouselImage(
            images: productModel.images!,
          )),
          const SizedBox(
            height: 5,
          ),
          Text(
            productModel.name!,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                overflow: TextOverflow.ellipsis),
          ),
          const SizedBox(
            height: 2,
          ),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "${productModel.price!} \$",
                          style: const TextStyle(fontSize: 13),
                        )),
                    const SizedBox(
                      width: 5,
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "${productModel.oldPrice!} \$",
                        style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12.5,
                            decoration: TextDecoration.lineThrough),
                      ),
                    )
                  ],
                ),
              ),
              GestureDetector(
                child: Icon(
                  Icons.favorite,
                  size: 20,
                  color: productModel.in_favorites! ? Colors.red : Colors.grey,
                ),
                onTap: () {
                  context
                      .read<FavoraiteBloc>()
                      .add(AddfavoraiteEvent(pm: productModel));
                  context
                      .read<ProductBloc>()
                      .add(RefreshEvent(pm: productModel, isfavoraite: true));
                },
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Center(
            child: GestureDetector(
              child: Icon(Icons.shopping_cart,
                  size: 20,
                  color: productModel.in_cart! ? Colors.red : Colors.grey),
              onTap: () {
                context.read<CartBloc>().add(AddToCartEvent(pm: productModel));
                context.read<ProductBloc>().add(RefreshEvent(pm: productModel));
              },
            ),
          )
        ],
      ),
    );
  }
}

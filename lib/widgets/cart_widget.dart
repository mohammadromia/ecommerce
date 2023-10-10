
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/cart/bloc/cart_bloc.dart';
import '../blocs/favoraite/bloc/favoraite_bloc.dart';
import '../blocs/product/bloc/product_bloc.dart';
import '../models/product_model.dart';
import 'image_cached.dart';

// ignore: must_be_immutable
class CartWidget extends StatelessWidget {
  ProductModel productModel;
  CartWidget({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 6.5,
      padding: const EdgeInsets.all(2),
      child: Row(
        children: [
          Expanded(
              child: ImageCached(
                  urlimage: productModel.image!)),
          const SizedBox(width: 12.5),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.center,
                children: [
                  Text(
                    productModel.name!,
                    style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                          "${productModel.price!} \$"),
                      const SizedBox(
                        width: 5,
                      ),
                      if (productModel.price !=
                          productModel.oldPrice)
                        Text(
                          "${productModel.oldPrice!} \$",
                          style: const TextStyle(
                              decoration: TextDecoration
                                  .lineThrough),
                        ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      OutlinedButton(
                          onPressed: () {
                            context
                                .read<FavoraiteBloc>()
                                .add(AddfavoraiteEvent(
                                    pm: productModel));
                            context
                                .read<ProductBloc>()
                                .add(RefreshEvent(
                                    pm: productModel));
                          },
                          child: Icon(Icons.favorite,
                              color: productModel
                                      .in_favorites!
                                  ? Colors.red
                                  : Colors.grey)),
                      GestureDetector(
                        onTap: () {
                          context.read<CartBloc>().add(
                              AddToCartEvent(
                                  pm: productModel));

                          context.read<ProductBloc>().add(
                              RefreshEvent(
                                  pm: productModel));
                        },
                        child: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

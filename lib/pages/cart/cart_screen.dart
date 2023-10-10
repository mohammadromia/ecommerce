import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:e_commerce/blocs/cart/bloc/cart_bloc.dart';
import 'package:e_commerce/blocs/favoraite/bloc/favoraite_bloc.dart';

import '../../widgets/cart_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
        
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
        child: Column(
          children: [
            Expanded(
                child: state is LoadedCartState
                    ? ListView.separated(
                        itemCount: state.carts.length,
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 12,
                          );
                        },
                        itemBuilder: (context, index) {
                          return CartWidget(
                            productModel: state.carts[index],
                          );
                        })
                    : const Center(
                        child: Text("Loading....."),
                      )),
            if (state is FaliureFavoraiteState) const Text('Error'),
            if (state is LoadedCartState)
              Text(
                "TotalPrice : ${state.totalPrice} \$",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    ),
              )
          ],
        ),
      );
    }));
  }
}

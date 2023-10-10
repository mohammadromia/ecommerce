import 'package:e_commerce/blocs/favoraite/bloc/favoraite_bloc.dart';
import 'package:e_commerce/widgets/image_cached.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/product/bloc/product_bloc.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoraiteBloc, FavoraiteState>(
      builder: (context, state) {
        return Scaffold(
            body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12.5),
          child: Column(
            children: [
          
              if (state is FaliureFavoraiteState)
                const Center(
                  child: Text('error'),
                ),
              if (state is LoadingFavoraiteState)
                const Expanded(
                    child: Center(
                  child: CupertinoActivityIndicator(),
                )),
              if (state is LoadedFavoraiteState)
                Expanded(
                  child: ListView.builder(
                      itemCount: state.favorites.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: MediaQuery.of(context).size.height / 6,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          padding: const EdgeInsets.symmetric(
                              vertical: 2, horizontal: 2),
                          child: Row(
                            children: [
                              Expanded(
                                  child: ImageCached(
                                      urlimage: state.favorites[index].image!)),
                              const SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        state.favorites[index].name!,
                                        maxLines: 1,
                                        style: const TextStyle(
                                            fontSize: 16.5,
                                            fontWeight: FontWeight.bold,
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                      const SizedBox(
                                        height: 7,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                              "${state.favorites[index].price!} \$"),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "${state.favorites[index].oldPrice!} \$",
                                            style: const TextStyle(
                                                color: Colors.grey,
                                                decoration:
                                                    TextDecoration.lineThrough),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      MaterialButton(
                                        onPressed: () {
                                          context.read<FavoraiteBloc>().add(
                                              AddfavoraiteEvent(
                                                  pm: state.favorites[index]));
                                          context.read<ProductBloc>().add(
                                              RefreshEvent(
                                                  pm: state.favorites[index],
                                                  isfavoraite: true));
                                        },
                                        textColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25)),
                                        child: const Text("Remove"),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                )
            ],
          ),
        ));
      },
    );
  }
}

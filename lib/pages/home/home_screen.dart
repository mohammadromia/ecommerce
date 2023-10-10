// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:e_commerce/blocs/banners/bloc/banners_bloc.dart';

import '../../../blocs/category/bloc/category_bloc.dart';
import '../../../blocs/product/bloc/product_bloc.dart';
import '../../widgets/image_cached.dart';
import '../../widgets/product_widget.dart';
import '../../widgets/smooth_widget.dart';

class HomeScreen extends StatelessWidget {
   const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
      final pageController = PageController();

    return Scaffold(
      body: ListView(shrinkWrap: true, children: [
        const SizedBox(
          height: 5,
        ),
        BlocBuilder<BannersBloc, BannersState>(
          builder: (context, state) {
            if (state is LoadingBannersState) {
              const Center(
                child: CupertinoActivityIndicator(),
              );
            } else if (state is LoadedBannersState) {
              return Column(
                children: [
                  SizedBox(
                    height: 125,
                    width: double.infinity,
                    child: PageView.builder(
                      controller: pageController,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                            margin: const EdgeInsets.only(right: 15),
                            child: ImageCached(
                              urlimage: state.banners[index].url!,
                            ));
                      },
                      itemCount: state.banners.length,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: SmoothIndicatorCustom(
                        pageController: pageController,
                        count: state.banners.length),
                  )
                ],
              );
            } else if (state is ErrorBannersState) {
              return const Center(
                child: Text('error'),
              );
            }
            return const SizedBox(
              height: 150,
              child: CupertinoActivityIndicator(),
            );
          },
        ),
        const SizedBox(
          height: 15,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Categories",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                "View all",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        BlocBuilder<CategoryBloc, CategoryState>(
          builder: (context, state) {
            if (state is LoadingCategorystate) {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            } else if (state is LoadedCategorystate) {
              return SizedBox(
                height: 70,
                width: double.infinity,
                child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.categories.length,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        width: 15,
                      );
                    },
                    itemBuilder: (context, index) {
                      return CircleAvatar(
                        radius: 35,
                        child: ImageCached(
                          urlimage: state.categories[index].url!,
                        ),
                      );
                    }),
              );
            } else {
              return const Text('error');
            }
          },
        ),
        const SizedBox(
          height: 15,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Products",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                "View all",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is LoadingGetProductsState) {
              const Center(
                child: CupertinoActivityIndicator(),
              );
            } else if (state is FailedToGetProductsState) {
              return const Text('error');
            } else if (state is LoadedProductsSuccessState) {
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 12,
                    childAspectRatio: .6,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2),
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  return ProductWidget(
                    productModel: state.products[index],
                  );
                },
              );
            }
            return const SizedBox();
          },
        )
      ]),
    );
  }
}

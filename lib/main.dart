import 'package:e_commerce/blocs/auth/bloc/auth_bloc.dart';
import 'package:e_commerce/blocs/banners/bloc/banners_bloc.dart';
import 'package:e_commerce/blocs/cart/bloc/cart_bloc.dart';
import 'package:e_commerce/core/constants/constants.dart';
import 'package:e_commerce/core/network/localnetwork.dart';
import 'package:e_commerce/core/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/category/bloc/category_bloc.dart';
import 'blocs/favoraite/bloc/favoraite_bloc.dart';
import 'blocs/product/bloc/product_bloc.dart';
import 'pages/layout/layout_screen.dart';
import 'pages/login/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  

  
  
  await CacheNetwork.cacheInitialization();
  userToken = await CacheNetwork.getCacheData(key: 'token');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => FavoraiteBloc()..add(GetFavoriteEvent())),
        BlocProvider(create: (context) => CartBloc()..add(GetCartEvent())),
        BlocProvider(create: (context) => CategoryBloc()),
        BlocProvider(
            create: (context) =>
                ProductBloc(CartBloc())..add(GetProductEvent())),
        BlocProvider(
            create: (context) => BannersBloc()..add(GetBannersEvent())),
        BlocProvider(create: (context) => AuthBloc()),
      ],
      child: MaterialApp(
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: ThemeMode.dark,
          debugShowCheckedModeBanner: false,
          home: userToken == null ? const LayoutScreen() : LoginScreen()),
    );
  }
}

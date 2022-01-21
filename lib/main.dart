import 'dart:io';

import 'package:flutter/material.dart';
import './screens/splash_screen.dart';
import './screens/sellers_screen.dart';
import './screens/product_screen.dart';

void main() {
  runApp(const MyApp());
  HttpOverrides.global = MyHttpOverrides();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
      routes: {
        SellerScreen.routeName : (_) => const SellerScreen(),
        ProductScreen.routeName : (_) => const ProductScreen(),
      },
    );
  }
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}


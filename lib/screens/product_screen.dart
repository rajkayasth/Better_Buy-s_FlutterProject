import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/sellers.dart';
import '../models/product.dart';
import '../server_handler.dart';

class ProductScreen extends StatefulWidget {
  static const routeName = '/product-screen';

  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<Product> _products = [];
  bool _firstExec = true;

  void getProductPerSeller(int sellerId) {
    ServerHandler()
        .getProductsSeller(sellerId)
        .then((value) => setState(() {
              print(value);
              _products = value;
            }))
        .catchError((e) => print(e));
  }

  @override
  Widget build(BuildContext context) {
    Sellers sellers = ModalRoute.of(context)!.settings.arguments as Sellers;

    if (_firstExec) {
      getProductPerSeller(sellers.id!);
      _firstExec = false;
    }

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Better Buys',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 23.0,
                        color: Color(0xFF4E8489)),
                  ),
                  Container(
                    height: 50.0,
                    width: 50.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            ),

            //Loading Widgets
            if (_products == null)
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20.0,
                    width: 20.0,
                    child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Color(0xff4E8489)),
                      strokeWidth: 1.5,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      'Loading Products',
                      style: GoogleFonts.poppins(),
                    ),
                  ),
                ],
              ),

            //List Of Items
            SizedBox(
              height: 100.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _products.length,
                itemBuilder: (context, index) => Container(
                  height: 50.0,
                  width: 50.0,
                  color: Colors.blue,
                  margin: EdgeInsets.all(5.0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

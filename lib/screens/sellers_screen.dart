import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/sellers.dart';
import '../widgets/seller_item.dart';

class SellerScreen extends StatefulWidget {
  static const routeName = '/seller-screen ';

  const SellerScreen({Key? key}) : super(key: key);

  @override
  State<SellerScreen> createState() => _SellerScreenState();
}

class _SellerScreenState extends State<SellerScreen> {
  List<Color> sellerItemBackgroundColor = [];

  /*int getColorIndex(int index){
    return index % 4;
  }*/

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    sellerItemBackgroundColor.add(const Color(0xFFE6F3EC));
    sellerItemBackgroundColor.add(const Color(0xFFE6E6F2));
    sellerItemBackgroundColor.add(const Color(0xFFE4EDF4));
    sellerItemBackgroundColor.add(const Color(0xFFE4DAD9));
  }

  @override
  Widget build(BuildContext context) {
    List<Sellers> sellers =
        ModalRoute.of(context)!.settings.arguments as List<Sellers>;

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 30.0, vertical: 40.0),
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

              //List Of Sellers

              Column(
                children: sellers
                    .map((e) => SellerItem(
                          sellers: e,
                          backgroundColor:
                              sellerItemBackgroundColor[sellers.indexOf(e) % 4],
                        ))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

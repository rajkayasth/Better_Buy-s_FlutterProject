import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/sellers.dart';
import '../screens/product_screen.dart';

class SellerItem extends StatelessWidget {
  final Sellers sellers;
  final Color backgroundColor;

  const SellerItem(
      {Key? key, required this.sellers, required this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .pushNamed(ProductScreen.routeName, arguments: sellers),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        height: 200.0,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5.0, top: 40.0),
                  child: Container(
                    padding: EdgeInsets.only(left: 4.4),
                    child: Text(
                      sellers.name!,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 17),
                    ),
                  ),
                ),
                Container(
                    width: 120,
                    child: Text(
                      sellers.address!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 13),
                    )),
                SizedBox(
                  width: 120.0,
                  child: Text("No Rating",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                          fontSize: 13)),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.network(
                "https://whoisrishav.com/pk/better-buys/assets/${sellers.image!}",
                fit: BoxFit.cover,
              ),
            )
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
      ),
    );
  }
}

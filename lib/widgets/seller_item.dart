import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/sellers.dart';

class SellerItem extends StatelessWidget {
  final Sellers sellers;
  final Color backgroundColor;

  const SellerItem(
      {Key? key, required this.sellers, required this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                padding: const EdgeInsets.only(left: 5.0 ,top: 40.0),
                child: Text(
                  sellers.name!,
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 18),
                ),
              ),
              //Text(sellers.address!),
              Text("No Rating"),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.network(
                "https://whoisrishav.com/pk/better-buys/assets/${sellers.image!}"),
          )
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
    );
  }
}

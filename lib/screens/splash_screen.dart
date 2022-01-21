import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../server_handler.dart';
import './sellers_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool showLoadingSellers = false;
  var _timer;

  void getSellers() {
    ServerHandler()
        .getSellers()
        .then((value) => Navigator.of(context).popAndPushNamed(SellerScreen.routeName,arguments: value))
        .catchError((e) => print(e));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _timer = Timer(
        Duration(seconds: 3),
        () => {
              showLoadingSellers = true,
              setState(() {}),
              getSellers(),
            });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: const Color(0xffe6f3ec),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Better Buy-s',
                style: GoogleFonts.pacifico(
                    color: const Color(0xff4e8489), fontSize: 27)),
            if (showLoadingSellers)
              const SizedBox(
                height: 20.0,
                width: 20.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xff4e8489)),
                  strokeWidth: 1.9,
                ),
              ),
            if (showLoadingSellers)
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text(
                  'Loading Sellers',
                  style: GoogleFonts.poppins(),
                ),
              )
          ],
        ),
      ),
    );
  }
}

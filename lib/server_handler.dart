import 'dart:io';
import 'dart:convert';
import './models/sellers.dart';
import 'package:http/http.dart' as http;
import './models/product.dart';

class ServerHandler{
  String _baseUrl = "https://whoisrishav.com/pk/better-buys/api";

  //get list of Sellers
  Future<List<Sellers>> getSellers() async {
    try {

      /*Socket.connect("192.168.160.1", 8000).then((socket) {
        print('Connected to: '
            '${socket.remoteAddress.address}:${socket.remotePort}');
        socket.destroy();
      });*/
      List<Sellers> sellers =[];
      http.Response response = await http.get(Uri.parse('$_baseUrl/gen/sellers'));

      print(response.body);

      dynamic sellersList = json.decode(response.body)['sellers'];

      for(Map m in sellersList){
        sellers.add(Sellers.fromMap(m));
      }

      return sellers;

    } catch (e) {
      /*ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(),
      ));*/
      print('Server Handler : error : ' + e.toString());
      rethrow;
    }
  }
  ///Getting Products from Seller
  Future<List<Product>> getProductsSeller(int? sellerId) async {
    try{
      List<Product> products = [];
      
      http.Response response = await http.get(Uri.parse('$_baseUrl/gen/products?seller_id= $sellerId'));


      dynamic productsList = json.decode(response.body)['products'];

      print(products);

      for(Map m in productsList){
        products.add(Product.fromMap(m));
      }

      return products ;

    } catch(e){
      print('Server Handler : error : ' + e.toString());
      rethrow;
    }
    }

}



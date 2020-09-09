import 'dart:convert';

import 'package:shopping/model/product/product.dart';
import 'package:http/http.dart' as http;

abstract class ProductRepos {
  Future<List<Product>> fetchProduct();
}

class ProductRepositoryImpl extends ProductRepos {
  @override
  Future<List<Product>> fetchProduct() async {
    print("dwddddddddddddd");
    var response = await http.get('https://fakestoreapi.com/products?limit=5');
    if (response.statusCode == 200) {
      List responseList = jsonDecode(response.body.toString());
      List<Product> list = createProductList(responseList);
      print(list.length);
      return list;
    } else {
      print("dwddddddddddddd");
      throw Exception('Failed to load product');
    }
  }

  List<Product> createProductList(List data) {
    List<Product> list = <Product>[];
    for (int i = 0; i < data.length; i++) {
      int id = data[i]["id"];
      String title = data[i]["title"];
      double price = data[i]["price"];
      String description = data[i]["description"];
      String category = data[i]["category"];
      String image = data[i]["image"];
      Product product = Product(
          id: id,
          title: title,
          price: price,
          description: description,
          category: category,
          image: image);
      list.add(product);
    }
    return list;
  }
}

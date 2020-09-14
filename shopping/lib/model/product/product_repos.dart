import 'dart:convert';

import 'package:shopping/commons/utils/app_images.dart';
import 'package:shopping/model/product/product.dart';
import 'package:http/http.dart' as http;

class ProductRepos {
  Future<List<Product>> fetchProduct() async {
    print("Bat dau");
    var response = await http.get('https://fakestoreapi.com/products?limit=20');
    print(response.statusCode);
    if (response.statusCode == 200) {
      List responseList = jsonDecode(response.body.toString());
      print(response.body.toString());
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
      double price = double.parse((data[i]["price"]).toString());
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
      print("convert: ${product.price}");
    }
    return list;
  }

  Future<List<Product>> fetchProductCategory() async {
    List<Product> listProduct = <Product>[];

    listProduct.add(Product(
        id: 1,
        title: 'Bag',
        price: 500.0,
        description: 'This is a bag',
        category: "dw",
        image: AppAssets.icBag));
    listProduct.add(Product(
        id: 1,
        title: 'Bag',
        price: 500.0,
        description: 'This is a bag',
        category: "dw",
        image: AppAssets.icBag));
    listProduct.add(Product(
        id: 1,
        title: 'Bag',
        price: 500.0,
        description: 'This is a bag',
        category: "dw",
        image: AppAssets.icBag));
    listProduct.add(Product(
        id: 1,
        title: 'Bag',
        price: 500.0,
        description: 'This is a bag',
        category: "dw",
        image: AppAssets.icBag));
    listProduct.add(Product(
        id: 1,
        title: 'Bag',
        price: 500.0,
        description: 'This is a bag',
        category: "dw",
        image: AppAssets.icBag));

    return listProduct;
  }

  Future<Product> getProductItem() async {
    var response = await http.get('https://fakestoreapi.com/products/1');
    if (response.statusCode == 200) {
      Map productMap = jsonDecode(response.body);
//      var product=Product.fromJSON(json)
//      return product;
    } else {
      throw Exception("Failed to load Product!");
    }
  }

//  Product parseProduct(String responseBody) {final parsed=jsonDecode(responseBody).}
}

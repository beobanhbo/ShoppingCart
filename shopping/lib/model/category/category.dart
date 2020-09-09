import 'dart:convert';

import 'package:shopping/commons/utils/app_images.dart';
import 'package:shopping/model/product/product.dart';
import 'package:http/http.dart' as http;

class Category {
  final String type;
  final List<Product> list;

  Category(this.type, this.list);
}

class CategoryRepos {
  Future<List<Category>> fetchCategory() async {
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

    var listCategory = <Category>[];
    listCategory.add(Category('Hot Sales', listProduct));

    return listCategory;
  }

  Future<Product> fetchProduct() async {
    var response = await http.get('https://fakestoreapi.com/products?limit=5');
    if (response.statusCode == 200) {
      return Product.fromJSON((jsonDecode(response.body)));
    } else {
      throw Exception('Failed to load product');
    }
  }
}

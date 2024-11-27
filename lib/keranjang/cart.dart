import 'package:project_akhir/product/all_model.dart';

class Cart {
  static List<Products> cartItems = [];

  static void addToCart(Products product) {
    cartItems.add(product);
  }

  static void removeItem(Products product) {
    cartItems.removeWhere((item) => item.id == product.id);
  }

}

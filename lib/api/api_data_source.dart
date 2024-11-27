import 'package:project_akhir/api/base_network.dart';

class ApiDataSource {
  static ApiDataSource instance = ApiDataSource();
  Future<Map<String, dynamic>> loadAll() {
    return BaseNetwork.get("products/");
  }

  Future<Map<String, dynamic>> loadPhone() {
    return BaseNetwork.get("products/category/smartphones");
  }

  Future<Map<String, dynamic>> loadLaptop() {
    return BaseNetwork.get("products/category/laptops");
  }

  Future<Map<String, dynamic>> loadSkincare() {
    return BaseNetwork.get("products/category/skincare");
  }

  Future<Map<String, dynamic>> loadFurniture() {
    return BaseNetwork.get("products/category/furniture");
  }

  Future<Map<String, dynamic>> loadHomeDecoration() {
    return BaseNetwork.get("products/category/home-decoration");
  }

  Future<Map<String, dynamic>> loadFragrances() {
    return BaseNetwork.get("products/category/fragrances");
  }

  Future<Map<String, dynamic>> loadMenShirts() {
    return BaseNetwork.get("products/category/mens-shirts");
  }

  Future<Map<String, dynamic>> loadMenShoes() {
    return BaseNetwork.get("products/category/mens-shoes");
  }

  Future<Map<String, dynamic>> loadMenWatches() {
    return BaseNetwork.get("products/category/mens-watches");
  }

  Future<Map<String, dynamic>> loadMotorcycle() {
    return BaseNetwork.get("products/category/motorcycle");
  }

  Future<Map<String, dynamic>> loadWomenDress() {
    return BaseNetwork.get("products/category/womens-dresses");
  }

  Future<Map<String, dynamic>> loadWomenShoes() {
    return BaseNetwork.get("products/category/womens-shoes");
  }

  Future<Map<String, dynamic>> loadWomenBag() {
    return BaseNetwork.get("products/category/womens-bags");
  }

  Future<Map<String, dynamic>> loadWomenJewellery() {
    return BaseNetwork.get("products/category/womens-jewellery");
  }

  Future<Map<String, dynamic>> loadWomenWatches() {
    return BaseNetwork.get("products/category/womens-watches");
  }

  Future<Map<String, dynamic>> loadDetailAll(int idDiterima) {
    String id = idDiterima.toString();
    return BaseNetwork.get("products/$id");
  }

  Future<Map<String, dynamic>> loadDetailPhone(int idDiterima) {
    String id = idDiterima.toString();
    return BaseNetwork.get("products/category/smartphones/$id");
  }

  Future<Map<String, dynamic>> loadDetailLaptop(int idDiterima) {
    String id = idDiterima.toString();
    return BaseNetwork.get("products/category/laptops/$id");
  }

  Future<Map<String, dynamic>> loadDetailSkincare(int idDiterima) {
    String id = idDiterima.toString();
    return BaseNetwork.get("products/category/skincare/$id");
  }

  Future<Map<String, dynamic>> loadDetailFurniture(int idDiterima) {
    String id = idDiterima.toString();
    return BaseNetwork.get("products/category/furniture/$id");
  }

  Future<Map<String, dynamic>> loadDetailHomeDecoration(int idDiterima) {
    String id = idDiterima.toString();
    return BaseNetwork.get("products/category/home-decoration/$id");
  }

  Future<Map<String, dynamic>> loadDetailFragrances(int idDiterima) {
    String id = idDiterima.toString();
    return BaseNetwork.get("products/category/fragrances/$id");
  }

  Future<Map<String, dynamic>> loadDetailMenShirts(int idDiterima) {
    String id = idDiterima.toString();
    return BaseNetwork.get("products/category/mens-shirts/$id");
  }

  Future<Map<String, dynamic>> loadDetailMenShoes(int idDiterima) {
    String id = idDiterima.toString();
    return BaseNetwork.get("products/category/mens-shoes/$id");
  }

  Future<Map<String, dynamic>> loadDetailMenWatches(int idDiterima) {
    String id = idDiterima.toString();
    return BaseNetwork.get("products/category/mens-watches/$id");
  }

  Future<Map<String, dynamic>> loadDetailMotorcycle(int idDiterima) {
    String id = idDiterima.toString();
    return BaseNetwork.get("products/category/motorcycle/$id");
  }

  Future<Map<String, dynamic>> loadDetailWomenDress(int idDiterima) {
    String id = idDiterima.toString();
    return BaseNetwork.get("products/category/womens-dresses/$id");
  }

  Future<Map<String, dynamic>> loadDetailWomenShoes(int idDiterima) {
    String id = idDiterima.toString();
    return BaseNetwork.get("products/category/womens-shoes/$id");
  }

  Future<Map<String, dynamic>> loadDetailWomenBag(int idDiterima) {
    String id = idDiterima.toString();
    return BaseNetwork.get("products/category/womens-bags/$id");
  }

  Future<Map<String, dynamic>> loadDetailWomenJewellery(int idDiterima) {
    String id = idDiterima.toString();
    return BaseNetwork.get("products/category/womens-jewellery/$id");
  }

  Future<Map<String, dynamic>> loadDetailWomenWatches(int idDiterima) {
    String id = idDiterima.toString();
    return BaseNetwork.get("products/category/womens-watches/$id");
  }
}

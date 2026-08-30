import 'package:dio/dio.dart';

abstract class HomeDataSource {
  Future<Response> allCategories();
  Future<Response> allBrands();
  Future<Response> allProducts();
}
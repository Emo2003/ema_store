import 'dart:async';

import 'package:dio/dio.dart';

abstract class CategoryDataSource {
  Future<Response> getProductsByCategory(String category);
  Future <Response>getProductsByBrand(String brand);
}
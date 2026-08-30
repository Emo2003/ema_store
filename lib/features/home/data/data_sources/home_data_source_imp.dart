import 'package:dio/dio.dart';
import 'package:ema_store/core/services/network_service.dart';
import 'package:ema_store/features/home/data/data_sources/home_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeDataSource)
class HomeDataSourceImp implements HomeDataSource {
  NetworkService networkService;

  HomeDataSourceImp(this.networkService);

  @override
  Future<Response<dynamic>> allBrands() {
    return networkService.dio.get("v1/brands");
  }

  @override
  Future<Response<dynamic>> allCategories() {
    return networkService.dio.get("v1/categories");
  }

  @override
  Future<Response<dynamic>> allProducts() {
    return networkService.dio.get("v1/products");
  }
}

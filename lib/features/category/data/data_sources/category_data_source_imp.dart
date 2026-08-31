import 'package:dio/src/response.dart';
import 'package:ema_store/features/category/data/data_sources/category_data_source.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/services/network_service.dart';

@Injectable(as: CategoryDataSource)
class CategoryDataSourceImp implements CategoryDataSource {
  NetworkService networkService;

  CategoryDataSourceImp({required this.networkService});

  @override
  Future<Response<dynamic>> getProductsByBrand(String brand) {
    return networkService.dio.get(
      "v1/products",
      queryParameters: {"brand": brand},
    );
  }

  @override
  Future<Response<dynamic>> getProductsByCategory(String category) {
    return networkService.dio.get(
      "v1/products",
      queryParameters: {"category[in]": category},
    );
  }
}

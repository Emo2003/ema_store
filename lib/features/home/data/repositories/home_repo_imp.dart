import 'package:dio/dio.dart';
import 'package:ema_store/features/home/data/data_sources/home_data_source.dart';
import 'package:ema_store/features/home/data/models/brands/brands.dart';
import 'package:ema_store/features/home/data/models/categories/Categories.dart';
import 'package:ema_store/features/home/data/models/products/Products.dart';
import 'package:ema_store/features/home/data/repositories/home_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error_handling/failure.dart';

@Injectable(as: HomeRepo)
class HomeRepoImp implements HomeRepo {
  HomeDataSource homeDataSource;

  HomeRepoImp(this.homeDataSource);

  @override
  Future<List<Brands>> allBrands() async {
    try {
      var res = await homeDataSource.allBrands();
      final rawList = res.data['data'] as List;
      List<Brands> data = rawList.map((e) => Brands.fromJson(e)).toList();
      return data;
    } on DioException catch (e) {
      throw ServerFailure.fromDioError(e).message;
    } catch (e) {
      throw 'An unexpected error occurred. Please try again.';
    }
  }

  @override
  Future<List<Categories>> allCategories() async {
    try {
      var res = await homeDataSource.allCategories();
      final rawList = res.data['data'] as List;
      List<Categories> data = rawList
          .map((e) => Categories.fromJson(e))
          .toList();
      return data;
    } on DioException catch (e) {
      throw ServerFailure.fromDioError(e).message;
    } catch (e) {
      throw 'An unexpected error occurred. Please try again.';
    }
  }

  @override
  Future<List<Products>> allProducts() async {
    try {
      var res = await homeDataSource.allProducts();
      final rawList = res.data['data'] as List;
      List<Products> data = rawList.map((e) => Products.fromJson(e)).toList();
      return data;
    } on DioException catch (e) {
      throw ServerFailure.fromDioError(e).message;
    } catch (e) {
      throw 'An unexpected error occurred. Please try again.';
    }
  }
}

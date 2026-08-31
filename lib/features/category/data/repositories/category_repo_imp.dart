import 'package:ema_store/features/category/data/data_sources/category_data_source.dart';
import 'package:ema_store/features/category/data/repositories/category_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../home/data/models/products/Products.dart';

@Injectable(as: CategoryRepo)
class CategoryRepoImp implements CategoryRepo {
  final CategoryDataSource categoryDataSource;

  CategoryRepoImp({
    required this.categoryDataSource,
  });

  @override
  Future<List<Products>> getProductsByBrand(
      String brand,
      ) async {
    try {
      final response = await categoryDataSource.getProductsByBrand(brand);

      final List data = response.data['data'];

      return data
          .map(
            (product) => Products.fromJson(product),
      )
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch products by brand: $e');
    }
  }

  @override
  Future<List<Products>> getProductsByCategory(
      String category,
      ) async {
    try {
      final response =
      await categoryDataSource.getProductsByCategory(category);

      final List data = response.data['data'];

      return data
          .map(
            (product) => Products.fromJson(product),
      )
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch products by category: $e');
    }
  }
}
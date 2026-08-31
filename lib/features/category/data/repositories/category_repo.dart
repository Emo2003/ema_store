
import '../../../home/data/models/products/Products.dart';

abstract class CategoryRepo {
  Future<List<Products>>getProductsByCategory(String category);
  Future<List<Products>>getProductsByBrand(String brand);
}
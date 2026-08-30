import 'package:ema_store/features/home/data/models/brands/brands.dart';
import 'package:ema_store/features/home/data/models/categories/Categories.dart';
import 'package:ema_store/features/home/data/models/products/Products.dart';

abstract class HomeRepo {
  Future<List<Categories>> allCategories();
  Future<List<Brands>> allBrands();
  Future<List<Products>> allProducts();
}
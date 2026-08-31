
import '../../../home/data/models/products/Products.dart';

sealed class CategoryState {}

class CategoryInitialState extends CategoryState {}

//Categories States
class CategoryLoadingState extends CategoryState {}

class CategorySuccessState extends CategoryState {
  final List<Products> categories;

  CategorySuccessState({required this.categories});
}

class CategoryErrorState extends CategoryState {
  final String message;

  CategoryErrorState({required this.message});
}

//Brands States
class BrandLoadingState extends CategoryState {}

class BrandSuccessState extends CategoryState {
  final List<Products> brands;

  BrandSuccessState({required this.brands});
}

class BrandErrorState extends CategoryState {
  final String message;

  BrandErrorState({required this.message});
}
class CategorySearchState extends CategoryState {}

import '../../data/models/brands/brands.dart';
import '../../data/models/categories/Categories.dart';
import '../../data/models/products/Products.dart';

sealed class HomeState {}

final class HomeInitialState extends HomeState {}

//Categories States
final class HomeCategoriesLoadingState extends HomeState {}

final class HomeCategoriesSuccessState extends HomeState {
  final List<Categories> categories;

  HomeCategoriesSuccessState({required this.categories});
}

final class HomeCategoriesErrorState extends HomeState {
  final String message;

  HomeCategoriesErrorState({required this.message});
}

//Brands States
final class HomeBrandsLoadingState extends HomeState {}

final class HomeBrandsSuccessState extends HomeState {
  final List<Brands> brands;

  HomeBrandsSuccessState({required this.brands});
}

final class HomeBrandsErrorState extends HomeState {
  final String message;

  HomeBrandsErrorState({required this.message});
}

//Products States
final class HomeProductsLoadingState extends HomeState {}

final class HomeProductsSuccessState extends HomeState {
  final List<Products> products;

  HomeProductsSuccessState({required this.products});
}

final class HomeProductsErrorState extends HomeState {
  final String message;

  HomeProductsErrorState({required this.message});
}

class HomeProductsSearchState extends HomeState {}

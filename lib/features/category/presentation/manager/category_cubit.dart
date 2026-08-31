import 'package:ema_store/features/category/data/repositories/category_repo.dart';
import 'package:ema_store/features/category/presentation/manager/category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../home/data/models/products/Products.dart';

@lazySingleton
class CategoryCubit extends Cubit<CategoryState> {
  final CategoryRepo categoryRepo;

  CategoryCubit(this.categoryRepo) : super(CategoryInitialState());

  String? selectedCategoryId;
  String? selectedBrandId;

  List<Products> categoryProducts = [];
  List<Products> brandProducts = [];
  List<Products> searchResults = [];

  void selectCategory(String id) {
    selectedCategoryId = id;
    selectedBrandId = null;
    categoryProducts = [];
    searchResults = [];
    emit(CategoryInitialState());
  }

  void selectBrand(String id) {
    selectedBrandId = id;
    selectedCategoryId = null;

    brandProducts = [];
    searchResults = [];

    emit(CategoryInitialState());
  }

  Future<void> getProductsByCategory() async {
    if (selectedCategoryId == null) {
      return;
    }

    emit(CategoryLoadingState());

    try {
      final products = await categoryRepo.getProductsByCategory(
        selectedCategoryId!,
      );

      categoryProducts = products;
      searchResults = products;

      emit(CategorySuccessState(categories: products));
    } catch (e) {
      emit(CategoryErrorState(message: e.toString()));
    }
  }

  Future<void> getProductsByBrand() async {
    if (selectedBrandId == null) {
      return;
    }

    emit(BrandLoadingState());

    try {
      final products = await categoryRepo.getProductsByBrand(
        selectedBrandId!,
      );

      brandProducts = products;
      searchResults = products;

      emit(BrandSuccessState(brands: products));
    } catch (e) {
      emit(BrandErrorState(message: e.toString()));
    }
  }

  void searchProducts(String query) {
    final source = selectedCategoryId != null
        ? categoryProducts
        : brandProducts;

    final searchText = query.trim().toLowerCase();

    if (searchText.isEmpty) {
      searchResults = source;
    } else {
      searchResults = source.where((product) {
        return product.title?.toLowerCase().contains(searchText) ?? false;
      }).toList();
    }

    emit(CategorySearchState());
  }

  void clearSelection() {
    selectedCategoryId = null;
    selectedBrandId = null;

    categoryProducts = [];
    brandProducts = [];
    searchResults = [];

    emit(CategoryInitialState());
  }
}
import 'package:ema_store/features/home/data/repositories/home_repo.dart';
import 'package:ema_store/features/home/presentation/manager/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/brands/brands.dart';
import '../../data/models/categories/Categories.dart';
import '../../data/models/products/Products.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeRepo homeRepo;

  HomeCubit(this.homeRepo) : super(HomeInitialState());

  HomeCubit get(context) => BlocProvider.of(context);
  List<Categories> categories = [];
  List<Brands> brands = [];
  List<Products> products = [];
  List<Products> searchResults = [];

  Future<void> getAllCategories() async {
    emit(HomeCategoriesLoadingState());
    try {
       categories = await homeRepo.allCategories();
      emit(HomeCategoriesSuccessState(categories: categories));
    } catch (e) {
      emit(HomeCategoriesErrorState(message: e.toString()));
    }
  }

  Future<void> getAllBrands() async {
    emit(HomeBrandsLoadingState());
    try {
       brands = await homeRepo.allBrands();
      emit(HomeBrandsSuccessState(brands: brands));
    } catch (e) {
      emit(HomeBrandsErrorState(message: e.toString()));
    }
  }

  Future<void> getAllProducts() async {
    emit(HomeProductsLoadingState());
    try {
       products = await homeRepo.allProducts();
       searchResults = products;
      emit(HomeProductsSuccessState(products: products));
    } catch (e) {
      emit(HomeProductsErrorState(message: e.toString()));
    }
  }

  void searchProducts(String query) {
    if (query.trim().isEmpty) {
      searchResults = products;
    } else {
      searchResults = products.where((product) {
        return product.title
            ?.toLowerCase()
            .contains(query.trim().toLowerCase()) ??
            false;
      }).toList();
    }

    emit(HomeProductsSearchState());
  }


}



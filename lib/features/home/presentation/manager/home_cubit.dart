import 'package:ema_store/features/home/data/repositories/home_repo.dart';
import 'package:ema_store/features/home/presentation/manager/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeRepo homeRepo;

  HomeCubit(this.homeRepo) : super(HomeInitialState());

  HomeCubit get(context) => BlocProvider.of(context);

  Future<void> getAllCategories() async {
    emit(HomeCategoriesLoadingState());
    try {
      final categories = await homeRepo.allCategories();
      emit(HomeCategoriesSuccessState(categories: categories));
    } catch (e) {
      emit(HomeCategoriesErrorState(message: e.toString()));
    }
  }

  Future<void> getAllBrands() async {
    emit(HomeBrandsLoadingState());
    try {
      final brands = await homeRepo.allBrands();
      emit(HomeBrandsSuccessState(brands: brands));
    } catch (e) {
      emit(HomeBrandsErrorState(message: e.toString()));
    }
  }

  Future<void> getAllProducts() async {
    emit(HomeProductsLoadingState());
    try {
      final products = await homeRepo.allProducts();
      emit(HomeProductsSuccessState(products: products));
    } catch (e) {
      emit(HomeProductsErrorState(message: e.toString()));
    }
  }
}

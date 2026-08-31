import 'package:dio/src/response.dart';
import 'package:ema_store/core/services/network_service.dart';
import 'package:ema_store/features/wishlist/data/data_sources/wishlist_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: WishlistDataSource)
class WishlistDataSourceImp implements WishlistDataSource {
  NetworkService networkService;

  WishlistDataSourceImp({required this.networkService});

  @override
  Future<Response<dynamic>> addToWishlist(String productId) {
    return networkService.dio.post(
      "v1/wishlist",
      data: {"productId": productId},
    );
  }

  @override
  Future<Response<dynamic>> getWishlist() {
    return networkService.dio.get("v1/wishlist");
  }

  @override
  Future<Response<dynamic>> removeFromWishlist(String productId) {
    return networkService.dio.delete("v1/wishlist/$productId");
  }
}

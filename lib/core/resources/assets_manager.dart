const String imagePath = "assets/images";
const String jsonPath = "assets/json";
const String iconsPath = "assets/icons";
const String svgPath = "assets/svg_images";

abstract class ImageAssets {
  static const String logo = "$imagePath/logo.png";
  static const String photo = "$imagePath/photo.png";
}

abstract class SvgAssets {}

abstract class JsonAssets {}

abstract class IconsAssets {
  static const String home = "$iconsPath/home.svg";
  static const String homeActive = "$iconsPath/home_active.svg";
  static const String fav = "$iconsPath/fav.svg";
  static const String favActive = "$iconsPath/fav_active.svg";
  static const String profile = "$iconsPath/profile.svg";
  static const String profileActive = "$iconsPath/profile_active.svg";
  static const String categoryActive = "$iconsPath/category_active.svg";
  static const String category = "$iconsPath/category.svg";
  static const String cart = "$iconsPath/icon _shopping cart_.svg";
  static const String cartActive = "$iconsPath/icon _shopping cart_active.svg";
}

#  Ema Store

**Ema Store** is a modern Flutter-based e-commerce application that allows users to browse products, search and filter items, manage their wishlist and shopping cart, and complete the checkout process through a clean and user-friendly interface.

The project was built using **Flutter**, **Dart**, **BLoC/Cubit**, and **REST APIs**, with a focus on clean architecture, reusable components, and scalable project structure.

##  Features

*  **Authentication**

    * User Login
    * User Registration
    * Forgot Password
    * Password Reset

*  **Home**

    * Browse products
    * Browse categories
    * Browse brands
    * Search for products
    * View featured products

*  **Products**

    * View products by category
    * View products by brand
    * Search products
    * View product details
    * Add products to cart
    * Add/remove products from wishlist

*  **Wishlist**

    * Add products to wishlist
    * Remove products from wishlist
    * View favorite products

*  **Shopping Cart**

    * Add products to cart
    * Increase/decrease product quantity
    * Remove products from cart
    * View cart items
    * Calculate cart totals

*  **Checkout**

    * Review order details
    * Select delivery information
    * Fake payment flow
    * Place orders

*  **Profile**

    * View user information
    * Manage profile

##  Technologies & Tools

* **Flutter**
* **Dart**
* **BLoC / Cubit**
* **REST APIs**
* **Dio**
* **Dependency Injection**
* **GetIt**
* **Injectable**
* **Flutter ScreenUtil**
* **SVG Assets**
* **Git & GitHub**

##  Architecture

The application follows a feature-based architecture with separation of responsibilities between presentation, data, and business logic.

```text
lib/
├── core/
│   ├── config/
│   ├── error_handling/
│   ├── resources/
│   ├── routes/
│   └── widgets/
│
└── features/
    ├── auth/
    ├── home/
    ├── category/
    ├── products/
    ├── cart/
    ├── wishlist/
    ├── checkout/
    └── profile/
```

### State Management

**BLoC/Cubit** is used to manage application state and handle communication between the UI and business logic.

Examples include:

* `HomeCubit`
* `CategoryCubit`
* `CartCubit`
* `WishlistCubit`
* `ProfileCubit`

This keeps the UI separated from business logic and makes the application easier to maintain and extend.

##  Application Flow

```text
Authentication
      ↓
    Home
      ↓
Categories / Brands
      ↓
    Products
      ↓
Product Details
      ↓
     Cart
      ↓
   Checkout
      ↓
  Payment
      ↓
   Place Order
```

##  Screens

The application includes:

* Splash Screen
* Login
* Register
* Forgot Password
* Reset Password
* Home
* Categories
* Products
* Product Details
* Wishlist
* Cart
* Checkout
* Payment
* Profile

##  Getting Started

### Prerequisites

Make sure you have Flutter installed on your machine.

You can verify your Flutter installation using:

```bash
flutter doctor
```

### Installation

1. Clone the repository:

```bash
git clone https://github.com/your-username/ema_store.git
```

2. Navigate to the project:

```bash
cd ema_store
```

3. Get the dependencies:

```bash
flutter pub get
```

4. Run the application:

```bash
flutter run
```

##  API

The application communicates with a RESTful backend to retrieve and manage:

* Products
* Categories
* Brands
* Users
* Wishlist
* Cart
* Orders

API communication is handled using **Dio**, while Cubits manage the application state and UI updates.

##  Screenshots

*Add screenshots of the application here.*

Example:

```text
screenshots/
├── login.png
├── home.png
├── products.png
├── product_details.png
├── wishlist.png
├── cart.png
└── checkout.png
```

##  Project Goals

The main goals of this project were to:

* Build a complete e-commerce application using Flutter.
* Practice state management with BLoC/Cubit.
* Work with REST APIs.
* Apply clean and maintainable project architecture.
* Implement reusable UI components.
* Handle navigation between multiple application flows.
* Build a complete shopping experience from browsing products to placing an order.

##  Developer

**Eman Ismail**

Flutter Developer | Computer Science Graduate

---

# Ema Store

**Ema Store** is a modern Flutter-based e-commerce application that allows users to browse products, search and filter items, manage their wishlist and shopping cart, and complete the checkout process through a clean and user-friendly interface.

The project was built using **Flutter, Dart, BLoC/Cubit, and REST APIs**, with a focus on clean architecture, reusable components, and a scalable project structure.

---

## Features

### Authentication

* User Login
* User Registration
* Forgot Password
* Password Reset

### Home

* Browse products
* Browse categories
* Browse brands
* Search for products
* View featured products

### Products

* View products by category
* View products by brand
* Search products
* View product details
* Add products to cart
* Add/remove products from wishlist

### Wishlist

* Add products to wishlist
* Remove products from wishlist
* View favorite products

### Shopping Cart

* Add products to cart
* Increase/decrease product quantity
* Remove products from cart
* View cart items
* Calculate cart totals

### Checkout

* Review order details
* Select delivery information
* Fake payment flow
* Place orders

### Profile

* View user information
* Manage profile

---

## Screenshots

### Authentication

<p align="center">
  <img src="https://github.com/user-attachments/assets/cdf64222-f5d9-4fa7-9a27-88136e4634ce" width="180"/>
  <img src="https://github.com/user-attachments/assets/9a986f82-4f48-4e01-a8cd-05e4e70a61ba" width="180"/>
  <img src="https://github.com/user-attachments/assets/a82adac3-5681-4cc0-944b-aa570c06629e" width="180"/>
  <img src="https://github.com/user-attachments/assets/99c2649a-578b-4f8b-8195-ad8542a70a2c" width="180"/>
</p>

### Home and Product Discovery

<p align="center">
  <img src="https://github.com/user-attachments/assets/8cfb927e-711a-4edd-8851-7a64f0a73cbc" width="180"/>
  <img src="https://github.com/user-attachments/assets/28397c39-44b5-418d-899b-9e6a2ce5a158" width="180"/>
  <img src="https://github.com/user-attachments/assets/0f5e2779-9614-478f-8274-52bdfc48ad49" width="180"/>
  <img src="https://github.com/user-attachments/assets/f3bbcd78-5727-48bd-b55a-2d10325c5efc" width="180"/>
</p>

### Products and Wishlist

<p align="center">
  <img src="https://github.com/user-attachments/assets/859b3eaa-7124-48e7-b27c-001d44e29bc2" width="180"/>
  <img src="https://github.com/user-attachments/assets/0330b646-64cd-4419-9aa7-5a9221325b5d" width="180"/>
  <img src="https://github.com/user-attachments/assets/e875fd43-5772-48c4-aae1-5af64bf84b02" width="180"/>
  <img src="https://github.com/user-attachments/assets/c53e0b0f-0dc4-4f02-ba09-760ea60c72d0" width="180"/>
</p>

### Cart and Checkout

<p align="center">
  <img src="https://github.com/user-attachments/assets/6483bbc0-4a37-4c68-8c50-339fca5e2d08" width="180"/>
  <img src="https://github.com/user-attachments/assets/04fe7bfb-876d-4b16-8337-2ed16ebb22bf" width="180"/>
  <img src="https://github.com/user-attachments/assets/ab941ab6-8938-4645-8d8c-69330c971cd1" width="180"/>
  <img src="https://github.com/user-attachments/assets/b8b96a8a-0b74-49e4-b791-201133a33990" width="180"/>
</p>

### Profile and Orders

<p align="center">
  <img src="https://github.com/user-attachments/assets/062fa1de-ff8e-499b-b98e-4daa034b7bee" width="180"/>
  <img src="https://github.com/user-attachments/assets/51140878-3e45-4647-95cb-e5d9ff8fd66f" width="180"/>
</p>

---

## Technologies and Tools

* **Flutter**
* **Dart**
* **BLoC / Cubit**
* **REST APIs**
* **Dio**
* **GetIt**
* **Injectable**
* **Dependency Injection**
* **Flutter ScreenUtil**
* **SVG Assets**
* **Git & GitHub**

---

## Architecture

The application follows a feature-based architecture with a clear separation of responsibilities between presentation, business logic, and data layers.

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

---

## Application Flow

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

---

## API Integration

The application communicates with a RESTful backend to retrieve and manage:

* Products
* Categories
* Brands
* Users
* Wishlist
* Cart
* Orders

API communication is handled using **Dio**, while Cubits manage application state and UI updates.

---

## Getting Started

### Prerequisites

Make sure you have Flutter installed on your machine.

Verify your Flutter installation:

```bash
flutter doctor
```

### Installation

Clone the repository:

```bash
git clone https://github.com/your-username/ema_store.git
```

Navigate to the project:

```bash
cd ema_store
```

Install dependencies:

```bash
flutter pub get
```

Run the application:

```bash
flutter run
```

---

## Project Goals

The main goals of this project were to:

* Build a complete e-commerce application using Flutter
* Practice state management with BLoC/Cubit
* Work with REST APIs
* Apply clean and maintainable architecture
* Implement reusable UI components
* Handle navigation between multiple application flows
* Build a complete shopping experience from browsing products to placing an order

---

## Developer

**Eman Medhat**

Flutter Developer | Computer Science Graduate

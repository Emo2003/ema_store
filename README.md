<div align="center">

# EMA STORE

### A modern e-commerce experience, built with Flutter

*Browse. Search. Wishlist. Checkout. Pay securely with Stripe.*

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![BLoC](https://img.shields.io/badge/State_Management-BLoC%2FCubit-4285F4?style=for-the-badge)
![REST API](https://img.shields.io/badge/REST-API-FF6F00?style=for-the-badge)
![Stripe](https://img.shields.io/badge/Payment-Stripe-635BFF?style=for-the-badge&logo=stripe&logoColor=white)

</div>

<br>

---

## About the Project

**Ema Store** is a full-featured Flutter e-commerce application designed to provide a complete shopping experience — from authentication and product discovery to cart management, secure Stripe payments, and order placement.

The project was built with a production-oriented mindset, focusing on **feature-based clean architecture, predictable state management, reusable UI components, REST API integration, and maintainable code structure**.

The application covers the complete customer journey: users can create an account, browse products and categories, search for products, manage their wishlist and cart, maintain their delivery address, complete payment through **Stripe**, and review their previous orders.

The goal is to build an e-commerce experience that feels simple for the user while maintaining a scalable and organized codebase behind the scenes.

<br>

---

## Feature Overview

<table>
<tr>
<td width="50%" valign="top">

### Authentication

- User login
- User registration
- Forgot password
- Password reset
- Authentication state handling

### Home

- Product browsing
- Category browsing
- Brand browsing
- Product search
- Featured product highlights
- Product discovery

### Products

- Browse products by category
- Browse products by brand
- Search products
- Product details
- Add products to cart
- Add / remove products from wishlist

</td>

<td width="50%" valign="top">

### Wishlist

- Add products to wishlist
- Remove products from wishlist
- View saved products
- Manage favorite products

### Shopping Cart

- Add products to cart
- Increase / decrease quantity
- Remove products
- Live cart summary
- Automatic total calculation

### Checkout & Payment

- Order review
- Delivery details from saved profile address
- Stripe payment integration
- Secure payment flow
- Payment success / failure handling
- Order placement after successful checkout

### Profile & Orders

- View account information
- Manage profile details
- Add and manage delivery address
- View order history

</td>
</tr>
</table>

<br>

---

## Screenshots

<div align="center">

### Authentication

<img src="https://github.com/user-attachments/assets/e875fd43-5772-48c4-aae1-5af64bf84b02" width="170"/>
<img src="https://github.com/user-attachments/assets/c53e0b0f-0dc4-4f02-ba09-760ea60c72d0" width="170"/>
<img src="https://github.com/user-attachments/assets/6483bbc0-4a37-4c68-8c50-339fca5e2d08" width="170"/>
<img src="https://github.com/user-attachments/assets/04fe7bfb-876d-4b16-8337-2ed16ebb22bf" width="170"/>
<img src="https://github.com/user-attachments/assets/ab941ab6-8938-4645-8d8c-69330c971cd1" width="170"/>

<br><br>

### Home & Product Discovery

<img src="https://github.com/user-attachments/assets/b8b96a8a-0b74-49e4-b791-201133a33990" width="170"/>
<img src="https://github.com/user-attachments/assets/062fa1de-ff8e-499b-b98e-4daa034b7bee" width="170"/>
<img src="https://github.com/user-attachments/assets/0330b646-64cd-4419-9aa7-5a9221325b5d" width="170"/>

<br><br>

### Products & Wishlist

<img src="https://github.com/user-attachments/assets/51140878-3e45-4647-95cb-e5d9ff8fd66f" width="170"/>
<img src="https://github.com/user-attachments/assets/28397c39-44b5-418d-899b-9e6a2ce5a158" width="170"/>
<img src="https://github.com/user-attachments/assets/cdf64222-f5d9-4fa7-9a27-88136e4634ce" width="170"/>

<br><br>

### Cart & Checkout

<img src="https://github.com/user-attachments/assets/9a986f82-4f48-4e01-a8cd-05e4e70a61ba" width="170"/>
<img src="https://github.com/user-attachments/assets/a82adac3-5681-4cc0-944b-aa570c06629e" width="170"/>
<img src="https://github.com/user-attachments/assets/99c2649a-578b-4f8b-8195-ad8542a70a2c" width="170"/>
<img src="https://github.com/user-attachments/assets/8cfb927e-711a-4edd-8851-7a64f0a73cbc" width="170"/>

<br><br>

### Profile & Orders

<img src="https://github.com/user-attachments/assets/0f5e2779-9614-478f-8274-52bdfc48ad49" width="170"/>
<img src="https://github.com/user-attachments/assets/859b3eaa-7124-48e7-b27c-001d44e29bc2" width="170"/>
<img src="https://github.com/user-attachments/assets/f3bbcd78-5727-48bd-b55a-2d10325c5efc" width="170"/>

</div>

<br>

---

## Tech Stack

| Layer | Tools |
|---|---|
| **Framework** | Flutter, Dart |
| **Architecture** | Feature-Based Clean Architecture |
| **State Management** | BLoC / Cubit |
| **Networking** | Dio, REST APIs |
| **Payment** | Stripe |
| **Dependency Injection** | GetIt, Injectable |
| **Local Storage** | FlutterSecureStorage |
| **UI Utilities** | Flutter ScreenUtil, SVG Assets |
| **Error Handling** | Custom Failure / API Error Handling |
| **Version Control** | Git & GitHub |

<br>

---

## Architecture

Ema Store follows a **feature-based clean architecture** that separates presentation, business logic, and data responsibilities.

This structure keeps features independent, makes the code easier to maintain, and allows individual parts of the application to evolve without tightly coupling the entire project.

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

### Feature Structure

Each feature is organized around its own responsibilities, keeping presentation, business logic, and data access separated.

```text
feature/
├── data/
│   ├── models/
│   ├── data_sources/
│   └── repositories/
│
├── presentation/
│   ├── cubit/
│   ├── screens/
│   └── widgets/
│
└── ...
```

This approach makes the application easier to extend, debug, and maintain as new features are added.

<br>

---

## State Management

The application uses **BLoC/Cubit** for predictable and reactive state management.

Each major feature has its own Cubit responsible for managing its state and coordinating the required operations.

| Cubit | Responsibility |
|---|---|
| `HomeCubit` | Home feed, featured products, categories & brands |
| `CategoryCubit` | Category-based product filtering |
| `CartCubit` | Cart items, quantities, and totals |
| `WishlistCubit` | Saved / favorite products |
| `ProfileCubit` | User profile, delivery address, and order history |

The UI remains primarily declarative, while feature-specific business logic and state transitions are handled by the corresponding Cubits.

<br>

---

## Profile-Driven Delivery

The user's **delivery address is managed through the Profile section** and reused during checkout.

Instead of entering delivery information repeatedly, returning users can select their saved address when reviewing their order.

The Profile section also provides access to the user's **order history**, giving users a central place to manage their account information, delivery details, and previous purchases.

<br>

---

## Stripe Payment Integration

Ema Store integrates **Stripe** into the checkout process to provide a real payment flow rather than a simulated payment experience.

The payment process is connected directly to the checkout journey:

```text
Cart
  ↓
Checkout
  ↓
Order Review
  ↓
Stripe Payment
  ↓
Payment Result
  ↓
Place Order
```

The application handles the payment flow and responds to successful and failed payment states before completing the order.

This integration demonstrates how a Flutter application can incorporate a third-party payment service into a complete e-commerce checkout flow.

> **Note:** Stripe credentials and other sensitive configuration values are kept outside the source code and should not be committed to the repository.

<br>

---

## Application Flow

<div align="center">

**Authentication**  
↓  
**Home**  
↓  
**Categories / Brands / Search**  
↓  
**Products**  
↓  
**Product Details**  
↓  
**Cart**  
↓  
**Checkout**  
↓  
**Stripe Payment**  
↓  
**Payment Result**  
↓  
**Place Order**  
↓  
**Order History**

</div>

<br>

---

## API Integration

The application communicates with a RESTful backend for its core e-commerce functionality.

### API Features

**Products · Categories · Brands · Users · Wishlist · Cart · Orders**

All HTTP communication is handled through **Dio**.

The application manages:

- API requests
- Request parameters
- Authentication headers
- Response parsing
- Loading states
- Success states
- Error states
- API failure handling

Cubits coordinate these operations and expose the resulting states to the presentation layer, keeping the UI reactive and separated from the networking implementation.

<br>

---

## Error Handling

The project uses a centralized error-handling approach to provide consistent failure states across the application.

Network and API errors are converted into application-level failures that can be handled by the corresponding Cubit and displayed appropriately by the UI.

This prevents individual screens from having to directly handle low-level networking exceptions.

<br>

---

## Dependency Injection

The application uses **GetIt** together with **Injectable** for dependency injection.

This allows dependencies such as repositories, services, and other application components to be registered and provided where needed without tightly coupling classes to their concrete implementations.

Benefits include:

- Better separation of concerns
- Easier dependency management
- Improved testability
- Reduced tight coupling
- Cleaner feature initialization

<br>

---

## Getting Started

### Prerequisites

Make sure Flutter is installed and properly configured on your machine.

```bash
flutter doctor
```

### Installation

**1. Clone the repository**

```bash
git clone https://github.com/Emo2003/ema_store.git
```

**2. Navigate into the project**

```bash
cd ema_store
```

**3. Install dependencies**

```bash
flutter pub get
```

**4. Configure environment variables**

Create the required environment configuration file and add the required API and Stripe configuration values.

```env
PUBLISHABLE_KEY=pk_test_your_publishable_key
SECRET_KEY=sk_test_your_secret_key
```

> Never commit secret keys or private credentials to GitHub.

**5. Run the application**

```bash
flutter run
```

<br>

---

## Project Goals

This project was built to:

- Build a complete e-commerce application using Flutter
- Practice scalable state management with BLoC/Cubit
- Integrate REST APIs using Dio
- Apply feature-based clean architecture
- Implement dependency injection using GetIt and Injectable
- Build reusable and consistent UI components
- Handle authentication and user-specific data
- Implement product search, categories, brands, cart, and wishlist functionality
- Build a complete checkout workflow
- Integrate Stripe payment processing
- Handle payment success and failure states
- Connect saved profile addresses with checkout
- Manage order history
- Practice clean, maintainable, and scalable Flutter development

<br>

---

## What I Learned

Building Ema Store provided practical experience with:

- Flutter application architecture
- BLoC/Cubit state management
- REST API integration
- Dio networking
- JSON model handling
- Authentication flows
- Dependency injection
- Error handling
- Cart and wishlist management
- Checkout workflows
- Stripe payment integration
- Profile and order management
- Feature-based project organization
- Git and GitHub workflow

<br>

---

## Developer

<div align="center">

### Eman Medhat

**Flutter Developer · Computer Science Graduate**

[GitHub](https://github.com/Emo2003)

</div>
